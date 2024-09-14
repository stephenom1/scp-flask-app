from flask import Flask, render_template, session, redirect, url_for, g, request
from flask_session import Session
from database import get_db, close_db
from werkzeug.security import generate_password_hash, check_password_hash
from functools import wraps
from forms import RegistrationForm, LoginForm, SortSCP, EditClearance, EditSCP, UploadAnnouncement
from datetime import datetime

app = Flask(__name__)
app.teardown_appcontext(close_db)
app.config['SECRET_KEY'] = 'this-is-my-secret-key'
app.config["SESSION_PERMANENT"] = False
app.config["SESSION_TYPE"] = "filesystem"
Session(app)
ratings = {}
ratings['som'] = []
clearance_levels = {1:['Safe', 'Euclid'], 2:['Safe', 'Euclid', 'Thaumiel', 'Keter'], 3:['Safe', 'Euclid', 'Thaumiel', 'Keter', 'Neutralised', 'Apollyon']}

################################################################################################

# admin id: som
# all passwords: 123

# Announcement route works on flask but not on server

################################################################################################

@app.before_request
def logged_in_user():
    g.user = session.get('user_id', None)
    g.clearance = session.get('clearance', None)

def login_required(view):
    @wraps(view)
    def wrapped_view(*args, **kwargs):
        if g.user is None:
            return redirect(url_for('login', next=request.url))
        return view(*args, **kwargs)
    return wrapped_view

@app.route("/", methods=['GET', 'POST'])
@login_required
def index():
    form = SortSCP()
    db = get_db()
    last_login_time = session['last_login_time']
    get_message = db.execute("""SELECT message FROM users WHERE user_id = ?;""", (session['user_id'],)).fetchone()
    message = get_message[0]
    db.execute("""DROP VIEW IF EXISTS ViewName;""")
    if session["clearance"] == 1:
        db.execute("""CREATE VIEW ViewName AS
                        SELECT * FROM scp_objects WHERE obj_class = 'Safe' OR obj_class = 'Euclid';""")
    elif session["clearance"] == 2:
        db.execute("""CREATE VIEW ViewName AS
                        SELECT * FROM scp_objects WHERE obj_class = 'Safe' OR obj_class = 'Euclid' OR obj_class = 'Thaumiel' OR obj_class = 'Keter';""")
    elif session["clearance"] == 3:
        db.execute("""CREATE VIEW ViewName AS
                        SELECT * FROM scp_objects WHERE obj_class = 'Safe' OR obj_class = 'Euclid' OR obj_class = 'Thaumiel' 
                        OR obj_class = 'Keter' OR obj_class = 'Neutralised' OR obj_class = 'Apollyon';""")
    if form.validate_on_submit():
        searchSCP = form.searchSCP.data
        classification = form.classification.data
        if searchSCP.isalnum():
            scp = db.execute("""SELECT code, title, obj_class, rating, link FROM ViewName WHERE code = ?;""", (searchSCP,)).fetchall()
        if searchSCP.isalpha():
            scp = db.execute("""SELECT code, title, obj_class, rating, link FROM ViewName WHERE title LIKE ?;""", (f'"%{searchSCP}%"',)).fetchall()
        else:
            if classification == 'Select All':
                scp = db.execute("""SELECT code, title, obj_class, rating, link FROM ViewName;""").fetchall()
            else:
                scp = db.execute("""SELECT code, title, obj_class, rating, link FROM ViewName
                                                    WHERE obj_class = ?;""", (classification,)).fetchall()
        # return render_template("index.html", scp=scp, form=form, last_login_time=last_login_time, message=message)
        return render_template("index.html", scp=scp, form=form, last_login_time=last_login_time)
    scp = db.execute("""SELECT code, title, obj_class, rating, link FROM ViewName;""").fetchall()
    # return render_template("index.html", scp=scp, form=form, last_login_time=last_login_time, message=message)
    return render_template("index.html", scp=scp, form=form, last_login_time=last_login_time)

@app.route('/register', methods=['GET', 'POST'])
def register():
    form = RegistrationForm()
    if form.validate_on_submit():
        user_id = form.user_id.data
        password = form.password.data
        password2 = form.password2.data
        db = get_db()
        possible_clashing_user = db.execute("""SELECT * FROM users
                                        WHERE user_id = ?;""", (user_id,)).fetchone()
        if possible_clashing_user is not None:
            form.user_id.errors.append('User ID already taken')
        else:
            db.execute("""INSERT INTO users (user_id, password, clearance, is_employee)
                                VALUES (?, ?, 1, 'false');""", 
                                (user_id, generate_password_hash(password)) )
            db.commit()
            ratings[user_id] = []
            return redirect( url_for("login") )
    return render_template('register.html', form=form)

@app.route('/login', methods=['GET', 'POST'])
def login():
    form = LoginForm()
    if form.validate_on_submit():
        user_id = form.user_id.data
        password = form.password.data
        db = get_db()
        possible_clashing_user = db.execute("""SELECT * FROM users
                                        WHERE user_id = ? AND is_employee = 'false';""", (user_id,)).fetchone()
        if possible_clashing_user is None:
            form.user_id.errors.append('No such user')
        elif not check_password_hash(possible_clashing_user['password'], password):
            form.password.errors.append('Incorrect password')
        else:
            session.clear()
            session['user_id'] = user_id
            session['is_employee'] = False
            user_info = db.execute("""SELECT * FROM users 
                                    WHERE user_id = ? AND is_employee = 'false';""", (session['user_id'],)).fetchone()
            session['last_login_time'] = user_info['last_login_time']
            session['clearance'] = user_info['clearance']
            db.execute("""UPDATE users SET last_login_time = ? 
                            WHERE user_id = ?""", (datetime.now().strftime("%d-%m-%Y %H:%M:%S"), session['user_id']))
            db.commit()
            next_page = request.args.get('next')
            if not next_page:
                next_page = url_for('index')
            return redirect(next_page)
    return render_template('login.html', form=form)

@app.route('/employee_login', methods=['GET', 'POST'])
def employee_login():
    form = LoginForm()
    if form.validate_on_submit():
        user_id = form.user_id.data
        password = form.password.data
        db = get_db()
        possible_clashing_user = db.execute("""SELECT * FROM users
                                        WHERE user_id = ? AND is_employee = 'true';""", (user_id,)).fetchone()
        if possible_clashing_user is None:
            form.user_id.errors.append('No such user')
        elif not check_password_hash(possible_clashing_user['password'], password):
            form.password.errors.append('Incorrect password')
        else:
            session.clear()
            session['user_id'] = user_id
            session['is_employee'] = True
            session['clearance'] = 3
            emp_info = db.execute("""SELECT last_login_time FROM users 
                                    WHERE user_id = ? AND is_employee = 'true';""", (session['user_id'],)).fetchone()
            session['last_login_time'] = emp_info['last_login_time']
            db.execute("""UPDATE users SET last_login_time = ? 
                            WHERE user_id = ?""", (datetime.now().strftime("%d-%m-%Y %H:%M:%S"), session['user_id']))
            db.commit()
            next_page = request.args.get('next')
            if not next_page:
                next_page = url_for('index')
            return redirect(next_page)
    return render_template('employee_login.html', form=form)

@app.route('/logout')
def logout():
    session.clear()
    return redirect( url_for('index') )

@app.route("/<scp_id>")
@login_required
def scp(scp_id):
    scp_id = scp_id.upper()
    db = get_db()
    scp = db.execute("""SELECT * FROM ViewName
                        WHERE code = ?;""", (scp_id,)).fetchone()
    exists = db.execute("""SELECT * FROM scp_objects
                        WHERE code = ?;""", (scp_id,)).fetchone()
    if exists and not scp:
        return redirect( url_for('employee_login') )
    elif not exists and not scp:
        return render_template("not_found.html")
    else:
        return render_template("scp.html", scp=scp)

@app.route("/inc_rating/<scp_id>")
@login_required
def inc_rating(scp_id):
    db = get_db()
    if scp_id not in ratings[session['user_id']]:
        ratings[session['user_id']].append(scp_id)
    elif scp_id in ratings[session['user_id']]:
        scp = db.execute("""SELECT * FROM scp_objects
                    WHERE code = ?;""", (scp_id,)).fetchone()
        return render_template("scp.html", scp=scp, message='You have already rated this SCP')
    db.execute("""UPDATE scp_objects SET rating = rating + 1
                        WHERE code = ?;""", (scp_id,))
    db.commit()
    return redirect(url_for('scp', scp_id=scp_id))

@app.route("/emp_dashboard", methods=['GET', 'POST'])
@login_required
def emp_dashboard():
    if session['is_employee'] == False:
        return redirect(url_for('employee_login'))
    db = get_db()
    users = db.execute("""SELECT user_id, clearance, last_login_time FROM users WHERE is_employee = 'false';""").fetchall()
    scps = db.execute("""SELECT code, title, obj_class, rating FROM scp_objects;""").fetchall()
    return render_template('emp_dashboard.html', users=users, scps=scps)

@app.route("/emp_dashboard/edit_user/<user_id>", methods=['GET', 'POST'])
@login_required
def edit_user(user_id):
    if session['is_employee'] == False:
        return redirect(url_for('employee_login'))
    db = get_db()
    user = db.execute("""SELECT * FROM users
                    WHERE user_id = ?;""", (user_id,)).fetchone()
    form = EditClearance(clearance=user["clearance"])
    if form.validate_on_submit():
        clearance = form.clearance.data
        print(clearance)
        db.execute("""UPDATE users SET clearance = ? WHERE user_id = ?""", [clearance, user_id])
        db.commit()
        return redirect(url_for('edit_user', user_id=user["user_id"]))
    return render_template('edit_user.html', user=user, form=form)

@app.route("/emp_dashboard/edit_scp/<scp_id>", methods=['GET', 'POST'])
@login_required
def edit_scp(scp_id):
    if session['is_employee'] == False:
        return redirect(url_for('employee_login'))
    db = get_db()
    scp = db.execute("""SELECT * FROM scp_objects
                    WHERE code = ?;""", (scp_id,)).fetchone()
    form = EditSCP(new_obj_class=scp["obj_class"], new_rating=scp["rating"])
    if form.validate_on_submit():
        new_obj_class = form.new_obj_class.data
        new_rating = form.new_rating.data
        db.execute("""UPDATE scp_objects SET obj_class = ? WHERE code = ?""", [new_obj_class, scp_id])
        db.execute("""UPDATE scp_objects SET rating = ? WHERE code = ?""", [new_rating, scp_id])
        db.commit()
        return redirect(url_for('edit_scp', scp_id=scp["code"]))
    return render_template('edit_scp.html', scp=scp, form=form)

@app.route("/emp_dashboard/delete_user/<user_id>", methods=['GET', 'POST'])
@login_required
def delete_user(user_id):
    if session['is_employee'] == False:
        return redirect(url_for('employee_login'))
    db = get_db()
    db.execute("""DELETE FROM users WHERE user_id = ?;""", (user_id,))
    db.commit()
    return redirect(url_for('emp_dashboard'))

@app.route("/emp_dashboard/delete_scp/<scp_id>", methods=['GET', 'POST'])
@login_required
def delete_scp(scp_id):
    if session['is_employee'] == False:
        return redirect(url_for('employee_login'))
    db = get_db()
    db.execute("""DELETE FROM scp_objects WHERE code = ?;""", (scp_id,))
    db.commit()
    return redirect(url_for('emp_dashboard'))

@app.route("/emp_dashboard/announcement", methods=['GET', 'POST'])
@login_required
def announcement():
    if session['is_employee'] == False:
        return redirect(url_for('employee_login'))
    db = get_db()
    form = UploadAnnouncement()
    test = db.execute("""SELECT user_id FROM users""").fetchall()
    for i in test:
        form.recipient.choices.append(i[0])
    if form.validate_on_submit():
        recipient = form.recipient.data
        message = form.message.data
        db.execute("""UPDATE users SET message = ? WHERE user_id = ?""", [message, recipient])
        db.commit()
        return redirect(url_for('announcement'))
    return render_template('announcement.html', form=form)

@app.route("/about")
@login_required
def about():
    return render_template('about.html')