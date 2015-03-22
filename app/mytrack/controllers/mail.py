from flask import *
import mandrill

from ..config import *
from ..models import *

client = mandrill.Mandrill(MANDRILL_API_KEY)

def send_mail(message):
    try:
        result = client.messages.send(message=message, async=False)

    except mandrill.Error, e:
        print 'A mandrill error occurred: %s - %s' % (e.__class__, e)
        raise

def send_welcome_email(user, activation_link):
    message = { 'auto_html': None,
     'from_email': 'group78@eecs485.eecs.umich.edu',
     'from_name': 'AlbumMaster',
     'html': '<p>Hello *|FIRSTNAME|*,<br><br>Welcome to AlbumMaster, a free website provided by the Pink Fairy Armadillos that lets you create your own albums, upload pictures, and share them with other AlbumMaster users.<br><br>To get started, click the activation link below:<br>*|ACTLINK|*</p>',
     'merge': True,
     'merge_vars': [{'rcpt': user.email,
                     'vars': [{'name': 'firstname', 'content': user.firstname}, {'name': 'actlink', 'content': activation_link}]}],
     'preserve_recipients': None,
     'subject': 'Welcome to AlbumMaster, *|FIRSTNAME|*',
     'tags': ['welcome'],
     'text': None,
     'to': [{'email': user.email,
             'name': user.firstname + ' ' + user.lastname,
             'type': 'to'}]}

    send_mail(message)

def send_new_password(user, new_password):
    message = { 'auto_html': None,
     'from_email': 'group78@eecs485.eecs.umich.edu',
     'from_name': 'AlbumMaster',
     'html': '<p>Hello *|FIRSTNAME|*,<br><br>Your password has been reset.  Please use the below password to log in to your AlbumMaster account.<br><br>New Password: *|NEWPASSWORD|*<br><br>Feel free to change your password once you log in.</p>',
     'merge': True,
     'merge_vars': [{'rcpt': user.email,
                     'vars': [{'name': 'firstname', 'content': user.firstname}, {'name': 'newpassword', 'content': new_password}]}],
     'preserve_recipients': None,
     'subject': 'Account Password Reset',
     'tags': ['welcome'],
     'text': None,
     'to': [{'email': user.email,
             'name': user.firstname + ' ' + user.lastname,
             'type': 'to'}]}

    send_mail(message)