from flask import *
from werkzeug import secure_filename

from ..models import *
from ..config import *
from helpers import *

album = Blueprint('album', __name__, template_folder='templates')

@album.route('/album')
def album_route():
    albumid = request.args['id']
    album = Album.query.get(albumid)

    if not can_access_album(album):
        if is_logged_in():
            error = "That album doesn't exist or you are not allowed to access it"
            return render_template('error.html', error=error)
        else:
            error = "You cannot access that album, please log in"
            next_url = request.path + '?' + request.query_string
            return redirect(url_for('login.login_route', message=error, color='red', next_url=next_url))
        
    pics = db.session.query(Photo).join(Contain).filter(Contain.albumid==albumid).order_by(Contain.sequencenum)
    captions = db.session.query(Contain).filter(Contain.albumid==albumid)

    return render_template('album.html', album=album, pics=pics, captions=captions, edit=False)

@album.route('/album/edit', methods=['GET', 'POST'])
@requires_auth
def album_edit_route():
    albumid = request.args['id']
    album = Album.query.get(albumid)
    users = User.query.filter(User.username!=session['username']).add_column('username')
    acc_users = AlbumAccess.query.filter(AlbumAccess.albumid==albumid)
    acc_users_list = []
    for acc_user in acc_users:
        acc_users_list.append(acc_user.username)
    
    if not can_access_album_edit(album):
        error = "You can't edit that album silly"
        return render_template('error.html', error=error)

    pics = db.session.query(Photo).join(Contain).filter(Contain.albumid==albumid).order_by(Contain.sequencenum)

    if request.method == 'POST' and request.form['op'] == 'add':
        file = request.files['file']
        if file and allowed_file(file.filename):
            filename = secure_filename(file.filename)
            caption = request.form['caption']
            albumid = request.form['albumid']
            filename = add_pic(filename, albumid, caption)
            file.save(UPLOAD_FOLDER + filename)
    elif request.method == 'POST' and request.form['op'] == 'delete':
        picid = request.form['picid']
        delete_pic(picid, albumid)

    elif request.method == 'POST' and request.form['op'] == 'update':
        new_acc_users = []
        for user in users:
            if user.username in request.form:
                new_acc_users.append(user.username)
        update_album(albumid, request.form['title'], request.form['access'], new_acc_users)
        return redirect(url_for('album.album_route', id=albumid))

    return render_template('album.html', album=album, pics=pics, users=users, acc_users_list=acc_users_list, edit=True)