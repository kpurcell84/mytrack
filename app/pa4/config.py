import os

APP_ROOT = os.path.dirname(os.path.abspath(__file__))
UPLOAD_FOLDER = os.path.join(APP_ROOT, 'static/img/db/')
DATABASE = 'mysql://group78:fuckohio@localhost/group78'
URL_PREFIX = "/utemnb/pa4"
SECRET_KEY = '6\x1c\x87\xc5\x9ay$\xf8b\xe6Ms9\xef\xbb\xd2f\xda\xb5 \x8e\xe6\xae\xcc'
MANDRILL_API_KEY = 'ckondWYRxP-L5cPMD3arNQ'
SEND_EMAILS = True
SERVER_NAME = 'localhost'