from flask import *

from ..models import *
from helpers import *

albums = Blueprint('albums', __name__, template_folder='templates')

@albums.route('/albums')
@requires_auth
def albums_route():
    username = request.args['username']

    if not can_access_albums(username):
        if is_logged_in():
            error = "You cannot access those albums"
            return render_template('error.html', error=error)
        else:
            error = "You cannot access those albums, please log in"
            next_url = request.path + '?' + request.query_string
            return redirect(url_for('login.login_route', message=error, color='red', next_url=next_url))

    useralbums = Album.query.filter(Album.username==username)
    return render_template('albums.html', useralbums=useralbums, edit=False, username=username)

@albums.route('/albums/edit', methods=['GET', 'POST'])
@requires_auth
def albums_edit_route():
    username = request.args['username']

    if not can_access_albums(username):
        error = "You cannot edit those albums"
        return render_template('error.html', error=error)
    
    useralbums = Album.query.filter(Album.username==username)
    if request.method == 'POST' and request.form['op'] == 'add':
        title = request.form['title']
        username = request.form['username']
        add_album(title, username)
    elif request.method == 'POST' and request.form['op'] == 'delete':
        albumid = request.form['albumid']
        delete_album(albumid)

    return render_template('albums.html', useralbums=useralbums, edit=True, username=username)