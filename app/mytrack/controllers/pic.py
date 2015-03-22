from flask import *

from ..models import *
from helpers import *

pic = Blueprint('pic', __name__, template_folder='templates')

@pic.route('/pic')
def pic_route():
    picid = request.args['id']
    pic = Photo.query.get(picid)
    # Check that pic is valid
    if pic == None:
        error = "That picture doesn't exist"
        return render_template('error.html', error=error)

    albumid = (Contain.query.filter(Contain.picid==picid).first()).albumid
    album = Album.query.get(albumid)

    if not can_access_album(album):
        if is_logged_in():
            error = "You cannot access that picture"
            return render_template('error.html', error=error)
        else:
            error = "You cannot access that picture, please log in"
            next_url = request.path + '?' + request.query_string
            return redirect(url_for('login.login_route', message=error, color='red', next_url=next_url))

    near_pics = find_near_pics(album.albumid, picid)
    prevpic = near_pics[0]
    nextpic = near_pics[1]
    
    caption = (Contain.query.filter(Contain.picid==picid).first()).caption

    return render_template('pic.html', pic=pic, caption=caption, album=album, prevpic=prevpic, nextpic=nextpic)