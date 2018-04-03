from flask import Flask,request,render_template,session,redirect,Response
from flask import Blueprint

import json
import datetime

from supermeeting import meeting
from supermeeting.views import manage
from ..untils.dbset import SQLHelper
from ..forms.form import LoginForm

login = Blueprint('login', __name__)

@login.route('/login',methods=['GET','POST'],endpoint='login_meet')
def login_room():
    if request.method=='GET':
        form=LoginForm()
        return render_template('login.html',form=form)
    form = LoginForm(formdata=request.form)
    if form.validate():
        user=form.data['user']
        pwd=form.data['pwd']
        result = SQLHelper.fetch_all('select name from user where name=%s and password=%s',[user,pwd])
        if result:
            session['user']=result[0]
            return redirect('/index')
        else:
            form.pwd.errors.append(('密码错误'))
            return render_template('/login.html',form=form)
    else:
        return render_template('login.html',form=form)
