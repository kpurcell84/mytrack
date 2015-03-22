from flask.ext.sqlalchemy import SQLAlchemy
 
db = SQLAlchemy()

class User(db.Model):

    __tablename__ = 'User'
    username = db.Column(db.String(20), primary_key=True)
    firstname = db.Column(db.String(20))
    lastname = db.Column(db.String(20))
    password = db.Column(db.String(20))
    email = db.Column(db.String(40))
    active = db.Column(db.String(3))
    
    def __init__(self, username, firstname, lastname, password, email):
        self.username = username
        self.firstname = firstname
        self.lastname = lastname
        self.password = password
        self.email = email
        self.active = 'no'

    def __repr__(self):
        return 'Username:' + self.username

class Album(db.Model):

    __tablename__ = 'Album'
    albumid = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(50))
    created = db.Column(db.Date)
    lastupdated = db.Column(db.Date)
    username = db.Column(db.String(20), db.ForeignKey('User.username'))
    access = db.Column(db.String(7))
    
    def __init__(self, title, created, lastupdated, username, access):
        self.title = title
        self.created = created
        self.lastupdated = lastupdated
        self.username = username
        self.access = access

    def __repr__(self):
        return 'Albumid:' + str(self.albumid)

class Photo(db.Model):

    __tablename__ = 'Photo'
    picid = db.Column(db.String(40), primary_key=True)
    url = db.Column(db.String(255))
    format = db.Column(db.String(3))
    date = db.Column(db.Date)
    
    def __init__(self, picid, url, format, date):
        self.picid = picid
        self.url = url
        self.format = format
        self.date = date
        self.caption = None

    def __repr__(self):
        return 'Picid:' + self.picid

class Contain(db.Model):

    __tablename__ = 'Contain'
    albumid = db.Column(db.Integer, db.ForeignKey('Album.albumid'), primary_key=True)
    picid = db.Column(db.String(40), db.ForeignKey('Photo.picid'), primary_key=True)
    caption = db.Column(db.String(255))
    sequencenum = db.Column(db.Integer)
    
    def __init__(self, albumid, picid, caption, sequencenum):
        self.albumid = albumid
        self.picid = picid
        self.caption = caption
        self.sequencenum = sequencenum

    def __repr__(self):
        return 'Albumid:' + str(self.albumid) + ' Picid:' + self.picid

class AlbumAccess(db.Model):

    __tablename__ = 'AlbumAccess'
    albumid = db.Column(db.Integer, db.ForeignKey('Album.albumid'), primary_key=True)
    username = db.Column(db.String(20), db.ForeignKey('User.username'), primary_key=True)
    
    def __init__(self, albumid, username):
        self.albumid = albumid
        self.username = username

    def __repr__(self):
        return 'Albumid:' + str(self.albumid) + ' Username:' + self.username