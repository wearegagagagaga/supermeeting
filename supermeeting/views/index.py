from flask import Flask,request,render_template,session,redirect,Response
from flask import Blueprint

import json
import datetime

from supermeeting import meeting
from supermeeting.views import manage
from ..untils.dbset import SQLHelper
from ..forms.form import LoginForm

index = Blueprint('index', __name__)

@index.route('/index',methods=['GET','POST'],endpoint='index_meet')
def index_room():
    time_list=SQLHelper.fetch_all('select id,node from times',[])
    room_list=SQLHelper.fetch_all('select id,name from room',[])
    user=session.get('user')[0]
    if request.method=='GET':
        dt =datetime.datetime.today().strftime('%Y/%m/%d')
        room_status = SQLHelper.fetch_all(
            'select room_id,choice_time,user.name from room_status left join user on user.id=room_status.user_id where datetime=%s',
            [dt])
        print(66666666)
        print('room_status>>>',room_status,'room_list>>>',room_list)

        room_dict={}
        for item in room_status:
            if room_dict.get(item[0]):
                room_dict[item[0]]['time'][item[1]] = item[2]
            else:
                room_dict[item[0]] = {'time': {item[1]: item[2]}}
        print('room_dict>>>',room_dict)
        print(  [i[1] for i in room_list])


        return render_template('index.html',time_list=time_list,room_list=room_list,user=user,room_dict=room_dict,dt=dt)
    else:
        date = request.form.get('datetime')
        print(date)
        if date:
            dt=datetime.date(*map(int,date.split('/')))
            print(dt)
            room_status = SQLHelper.fetch_all(
                'select room_id,choice_time,user.name from room_status left join user on user.id=room_status.user_id where datetime=%s',
                [dt])
            room_dict = {}
            for item in room_status:
                if room_dict.get(item[0]):
                    room_dict[item[0]]['time'][item[1]] = item[2]
                else:
                    room_dict[item[0]] = {'time': {item[1]: item[2]}}
            return render_template('index.html', time_list=time_list, room_list=room_list, user=user, room_dict=room_dict, dt=date)
        else:
            return redirect('/index')