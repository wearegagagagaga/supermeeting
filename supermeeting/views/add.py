from flask import Flask,request,render_template,session,redirect,Response
from flask import Blueprint

import json
import datetime

from supermeeting import meeting
from supermeeting.views import manage
from ..untils.dbset import SQLHelper
from ..forms.form import LoginForm

add = Blueprint('add', __name__)

@add.route('/add',methods=['POST'],endpoint='add_meet')
def add_room():
    if request.method=='POST':
        rid=request.form.get('rid')
        tid=request.form.get('tid')
        date=request.form.get('date')
        user=session.get('user')[0]
        user_id=SQLHelper.fetch_one('select id from user where name=%s',[user])
        row=SQLHelper.add('insert into room_status(datetime,room_id,choice_time,user_id)VALUES (%s,%s,%s,%s)',[date,rid,tid,user_id])
        ret={'stude':row,'rid':rid,'tid':tid,'user':user}
        return Response(json.dumps(ret))