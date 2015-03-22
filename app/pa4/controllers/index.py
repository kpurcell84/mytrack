from flask import *

from ..models import *
from helpers import *

index = Blueprint('index', __name__, template_folder='templates')

@index.route('/')
def index_route():
    message = None
    color = None
    if 'message' in request.args:
        message = request.args['message']
        color = request.args['color']

    if is_logged_in():
        print session['username']
        acc_albums = get_accessible_albums(session['username'])
        return render_template('user_index.html', acc_albums=acc_albums, message=message, color=color)
        
    else:
        public_albums = Album.query.filter(Album.access=='public')

        return render_template('public_index.html', public_albums=public_albums, message=message, color=color)