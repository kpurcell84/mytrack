from flask import *
import requests

from ..models import *
from ..config import *
from helpers import *
import mail

search = Blueprint('search', __name__, template_folder='templates')

@search.route('/search', methods=['GET', 'POST'])
def search_route():
    message = None
    color = None
    query = None
    if 'id' in request.args:
        picid = request.args['id'];
        query = (Contain.query.filter(Contain.picid==picid).first()).caption
        print query
    if 'message' in request.args:
        message = request.args['message']
        color = request.args['color']

    if request.method == 'POST':
        query = request.form['query']
        print 'you searched for: ' + query
        
    result = requests.get('http://%s:6078/search?q=%s' 
    						%(SERVER_NAME, query))
    # print result.text
    pics = []
    pics_info = result.json()
    for pic_info in pics_info['hits']:
    	pics.append(Photo.query.get(pic_info['id']))

    albumid = (Album.query.filter(Album.title=='search')).first().albumid
    captions = db.session.query(Contain).filter(Contain.albumid==albumid)

    return render_template('search.html', pics=pics, captions=captions, message=None, color=None)