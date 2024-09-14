from flask_wtf import FlaskForm
from wtforms import SubmitField, StringField, PasswordField, SelectField, RadioField, IntegerField
from wtforms.validators import InputRequired, EqualTo, length

class LoginForm(FlaskForm):
    user_id = StringField('Username:', validators=[InputRequired()])
    password = PasswordField('Password:', validators=[InputRequired()])
    submit = SubmitField('Submit')

class RegistrationForm(FlaskForm):
    user_id = StringField('Username:', validators=[InputRequired()])
    password = PasswordField('Password:', validators=[InputRequired()])
    password2 = PasswordField('Re-enter password:', validators=[InputRequired(), EqualTo('password')])
    submit = SubmitField('Submit')

class SortSCP(FlaskForm):
    searchSCP = StringField('Search Title: ')
    classification = SelectField('Classification: ', 
                        choices=['Select All', 'Safe', 'Euclid', 'Keter', 'Thaumiel', 'Neutralised', 'Apollyon'], 
                        default='Select All')
    submit = SubmitField('Submit')

class EditClearance(FlaskForm):
    clearance = RadioField ('Clearance: ', 
                        choices=[(1, '1 (Safe, Euclid)'), (2, '2 (Keter, Thaumiel)'), (3, '3 (Neutralised, Apollyon)')])
    submit = SubmitField('Save Changes')
    
class EditSCP(FlaskForm):
    new_obj_class = RadioField ('Object Class: ', 
                        choices=['Safe', 'Euclid', 'Keter', 'Thaumiel', 'Neutralised', 'Apollyon'])
    new_rating = IntegerField ('Overwrite Rating to: ')
    submit = SubmitField('Save Changes')
    
class UploadAnnouncement(FlaskForm):
    recipient = SelectField ('Choose Recipient: ', choices=[])
    message = StringField ('Message: ')
    submit = SubmitField('Send')