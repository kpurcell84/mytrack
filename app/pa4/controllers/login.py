from flask import *

from ..models import *
from ..config import *
from helpers import *
import mail

login = Blueprint('login', __name__, template_folder='templates')

@login.route('/login', methods=['GET', 'POST'])
def login_route():
    message = None
    color = None
    if 'message' in request.args:
        message = request.args['message']
        color = request.args['color']

    if request.method == 'GET':
        return render_template('login.html', message=message, color=color)
        
    if request.method == 'POST':
        username = request.form['username']
        error = ''
        if check_login(username, request.form['password']):
            if not check_active(username):
                error = 'Account not yet activated, check your email'
            else:
                session['username'] = username
                if 'next_url' in request.args:
                    # Go back to page user was trying to access
                    return redirect(request.args['next_url'])
                return redirect(url_for('index.index_route'))
        else:
            error = "Incorrect username or password"
            
        return render_template('login.html', message=error, color='red')

@login.route('/login/forgot', methods=['GET', 'POST'])
def forgot_pass_route():
    message = None
    color = None
    if 'message' in request.args:
        message = request.args['message']
        color = request.args['color']

    if request.method == 'GET':
        return render_template('forgot_pass.html', message=message, color=color)

    if request.method == 'POST':
        username = request.form['username']
        user = User.query.get(username)
        if user != None:
            new_password = generate_new_pass()
            update_user(username, user.firstname, user.lastname, new_password, user.email)
            if SEND_EMAILS:
                mail.send_new_password(user, new_password)

    message = "If user exists, an email has been sent with a new password"
    return redirect(url_for('login.login_route', message=message, color='green'))