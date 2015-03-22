from flask import *
from werkzeug import secure_filename
from itsdangerous import URLSafeSerializer, BadSignature

import os
import time
import random
import string
from datetime import datetime
from hashlib import md5
from sqlalchemy import desc
from functools import wraps

from ..config import *
from ..models import *
import mail

## Authentication ##

def requires_auth(f):
    @wraps(f)
    def decorated(*args, **kwargs):
        if is_logged_in():
            return f(*args, **kwargs)
        else:
            error = "You must be logged in to view this page"
            next_url = request.path + '?' + request.query_string
            print next_url
            return redirect(url_for('login.login_route', message=error, color='red', next_url=next_url))
    return decorated

def check_active(username):
    user = User.query.get(username)
    if user.active == 'yes':
        return True
    else:
        return False

def check_login(username, password):
    user = User.query.get(username)
    if user == None:
        return False
    if password == user.password:
        return True
    else:
        return False

def check_unique_username(username):
    user = User.query.get(username)
    if user == None:
        return True
    else:
        return False

def check_passwords_match(password1, password2):
        if password1==password2 and password1!="" and password2!="":
            return True
        else:
            return False

def is_logged_in():
    if "username" in session:
        if check_active(session['username']):
            return True
    return False

def get_cur_user():
    if is_logged_in():
        return User.query.get(session['username'])
    else:
        return None

def can_access_user(username):
    if username != session['username']:
        return False
    else:
        return True

def can_access_albums(owner):
    # Check if owner of the page is same as current user logged in
    if owner != session['username']:
        return False
    else:
        return True

def can_access_album(album):
    # Check that album is valid
    if album == None:
        return False
    elif album.access == 'public':
        return True
    elif is_logged_in() and album.username == session['username']:
        return True
    elif album.access == 'private':
        if not is_logged_in():
            return False  
        if check_accessible_album(session['username'], album.albumid):
            return True 

def can_access_album_edit(album):
    # Check that album is valid
    if album == None:
        return False
    elif album.username != session['username']:
        return False
    else:
        return True


def get_activation_serializer(secret_key=None):
    if secret_key is None:
        secret_key = SECRET_KEY
    return URLSafeSerializer(secret_key)

def get_activation_link(username):
    s = get_activation_serializer()
    payload = s.dumps(username)
    print payload
    return payload

def activate_user(username):
    user = User.query.get(username)
    user.active = 'yes'
    db.session.commit()

## Other ## 

def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1] in set(['txt', 'pdf', 'png', 'jpg', 'gif'])

def find_near_pics(albumid, picid):
    contains = Contain.query.filter(Contain.albumid==albumid).order_by('sequencenum')

    prevpic = ""
    nextpic = ""
    # Album with 1 photo
    if contains.count() == 1:
        prevpic = contains[0].picid
        nextpic = contains[0].picid
    else:
        for idx, contain in enumerate(contains):
            if contain.picid == picid:
                if idx == 0:
                    prevpic = contains[contains.count()-1].picid
                    nextpic = contains[idx+1].picid
                elif idx == contains.count()-1:
                    prevpic = contains[idx-1].picid
                    nextpic = contains[0].picid
                else:
                    prevpic = contains[idx-1].picid
                    nextpic = contains[idx+1].picid
                break

    return (prevpic, nextpic)

def generate_new_pass():
    new_pass = ''
    for i in range(3):
        new_pass += random.choice(string.ascii_lowercase) + random.choice(string.ascii_uppercase) + random.choice(string.digits)
    return new_pass


## Database lookup ##

# Get all the albums (besides their own) username can access
# Returns a dict of lists where the keys are usernames and the lists are 
# albums for that username
def get_accessible_albums(username):
    private_albums = db.session.query(Album).join(AlbumAccess).filter(((AlbumAccess.albumid==Album.albumid) & (AlbumAccess.username==username))).order_by(Album.username)

    public_albums = Album.query.filter(Album.access=='public').order_by(Album.username)

    personal_private_albums = Album.query.filter((Album.username==username) & (Album.access=='private')).order_by(Album.username)

    acc_albums = {}

    for album in private_albums:
        if album.username not in acc_albums:
            acc_albums[album.username] = list()
        acc_albums[album.username].append(album)

    for album in public_albums:
        if album.username not in acc_albums:
            acc_albums[album.username] = list()
        acc_albums[album.username].append(album)

    for album in personal_private_albums:
        if album.username not in acc_albums:
            acc_albums[album.username] = list()
        acc_albums[album.username].append(album)


    return acc_albums

# Check if username can access albumid
def check_accessible_album(username, albumid):
    if AlbumAccess.query.filter((AlbumAccess.albumid==albumid) & (AlbumAccess.username==username)).count() == 0:
        return False
    else:
        return True


## Database modification ##

def add_pic(filename, albumid, caption):
    date = time.strftime("%Y-%m-%d")
    format = filename.rsplit('.', 1)[1]
    picid = md5(filename + str(int(time.time()))).hexdigest()
    url = "/static/img/db/" + picid + "." + format

    contains = Contain.query.filter(Contain.albumid==albumid).order_by(desc('sequencenum'))
    sequencenum = 0
    # Non-empty album
    if contains.count() != 0:
        sequencenum = contains.first().sequencenum + 1

    db.session.add(Photo(picid, url, format, date))
    db.session.commit()
    db.session.add(Contain(albumid, picid, caption, sequencenum))
    db.session.commit()

    update_album_time(albumid)

    return picid + "." + format

def delete_pic(picid, albumid):
    photo = Photo.query.get(picid)
    photo_path = UPLOAD_FOLDER + picid + "." + photo.format
    os.remove(photo_path)
    db.session.delete(photo)
    db.session.commit()

    update_album_time(albumid)

def add_album(title, username):
    created = lastupdated = time.strftime("%Y-%m-%d")
    db.session.add(Album(title, created, lastupdated, username, "public"))
    db.session.commit()

def update_album_time(albumid):
    album = Album.query.get(albumid)
    album.lastupdated = time.strftime("%Y-%m-%d")
    db.session.commit()

def update_album(albumid, title, access, new_acc_users=[]):
    album = Album.query.get(albumid)
    album.title = title
    album.access = access

    # Delete old album accesses
    AlbumAccess.query.filter(AlbumAccess.albumid==albumid).delete()
    if access == 'private':
        # Add new album accesses
        for new_acc_user in new_acc_users:
            db.session.add(AlbumAccess(albumid, new_acc_user))

    db.session.commit()
    update_album_time(albumid)

def delete_album(albumid):
    contains = Contain.query.filter(Contain.albumid==albumid)
    for contain in contains:
        delete_pic(contain.picid, albumid)

    db.session.delete(Album.query.get(albumid))
    db.session.commit()

def add_user(username, firstname, lastname, password, email):
    new_user = User(username, firstname, lastname, password, email)
    db.session.add(new_user)
    db.session.commit()
    activation_link = request.url_root + URL_PREFIX[1:] + '/user/activate/' + get_activation_link(username)
    print activation_link
    if SEND_EMAILS:
        mail.send_welcome_email(new_user, activation_link)

def update_user(username, firstname, lastname, password, email):
    user = User.query.get(username)
    user.firstname = firstname
    user.lastname = lastname
    user.password = password
    user.email = email
    db.session.commit()

def delete_user(username):
    albums = Album.query.filter(Album.username==username)
    for album in albums:
        delete_album(album.albumid)

    db.session.delete(User.query.get(username))
    db.session.commit()