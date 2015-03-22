import os
from flask import Flask, session
from datetime import timedelta
from config import *
import controllers

app = Flask(__name__, template_folder='templates')

app.register_blueprint(controllers.index, url_prefix=URL_PREFIX)
app.register_blueprint(controllers.albums, url_prefix=URL_PREFIX)
app.register_blueprint(controllers.album, url_prefix=URL_PREFIX)
app.register_blueprint(controllers.pic, url_prefix=URL_PREFIX)
app.register_blueprint(controllers.login, url_prefix=URL_PREFIX)
app.register_blueprint(controllers.logout, url_prefix=URL_PREFIX)
app.register_blueprint(controllers.user, url_prefix=URL_PREFIX)
app.register_blueprint(controllers.search, url_prefix=URL_PREFIX)

app.config['SQLALCHEMY_DATABASE_URI'] = DATABASE
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

app.permanent_session_lifetime = timedelta(minutes=5)
app.secret_key = SECRET_KEY

from models import db
db.init_app(app)


# comment this out using a WSGI like gunicorn
# if you dont, gunicorn will ignore it anyway
# if __name__ == '__main__':
#     # listen on external IPs
#     app.run(host='0.0.0.0', port=3000, debug=True)
