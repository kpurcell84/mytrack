from flask import *

from ..models import *
from ..config import *
from helpers import *

user = Blueprint('user', __name__, template_folder='templates')

@user.route('/user', methods=['GET', 'POST'])
def user_route():
    if is_logged_in():
        return redirect(url_for('user.user_edit_route'))

    message = None
    color = None
    if 'message' in request.args:
        message = request.args['message']
        color = request.args['color']

    if request.method == 'POST':   
        if check_unique_username(request.form['username']):
            if check_passwords_match(request.form['password1'], request.form['password2']):
                print "match"
            add_user(request.form['username'], request.form['firstname'], request.form['lastname'], request.form['password1'], request.form['email'])
            message = "Account created successfully, check your email to activate your account."
            return redirect(url_for('index.index_route', message=message, color='green'))
        else:    
            message = "Username is unavailable. Please select a unique username."
            return redirect(url_for('user.user_route', message=message, color='red'))
    
    return render_template('new_user.html', message=message, color=color)

@user.route('/user/edit', methods=['GET', 'POST'])
@requires_auth
def user_edit_route():
    user = get_cur_user()
    message = None
    color = None
    if 'message' in request.args:
        message = request.args['message']
        color = request.args['color']

    if request.method == 'GET':
        return render_template('edit_user.html', user=user, message=message, color=color)

    elif request.method == 'POST':
        if check_login(user.username, request.form['cur_password']):
            if check_passwords_match(request.form['new_password1'], request.form['new_password2']):
                print "Update Password"
                update_user(user.username, request.form['firstname'], request.form['lastname'], request.form['new_password1'], request.form['email'])
                message = "Account updated successfully"
                return redirect(url_for('user.user_edit_route', message=message, color='green'))
            else:
                print "Current Password"
                update_user(user.username, request.form['firstname'], request.form['lastname'], request.form['cur_password'], request.form['email'])
                message = "Account updated successfully"
                return redirect(url_for('user.user_edit_route', message=message, color='green'))
        else:
            message = "Incorrect account password."
            return redirect(url_for('user.user_edit_route', message=message, color='red'))

@user.route('/user/delete', methods=['POST'])
def user_delete_route():
    delete_user(session['username'])
    return redirect(url_for('logout.logout_route'))

@user.route('/user/activate/<payload>')
def user_activate_route(payload):
    message = None
    color = None
    if 'message' in request.args:
        message = request.args['message']
        color = request.args['color']

    s = get_activation_serializer()
    try:
        username = s.loads(payload)
    except BadSignature:
        abort(404)

    activate_user(username)
    session['username'] = username

    message = "Account successfully activated!"
    color = 'green'

    return redirect(url_for('index.index_route', message=message, color=color))