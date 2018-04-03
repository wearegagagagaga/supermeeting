from flask import Flask,request,render_template,session,redirect,Response
from flask import Blueprint

import json
import datetime

from supermeeting import meeting
from supermeeting.views import manage
from ..untils.dbset import SQLHelper
from ..forms.form import LoginForm

logout = Blueprint('logout', __name__)

@logout.route('/logout',methods=['GET',],endpoint='logout_meet')
def logout_room():
    if request.method=='GET':
        session.pop('user',None)
        return redirect('/login')