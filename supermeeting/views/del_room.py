from flask import Flask,request,render_template,session,redirect,Response
from flask import Blueprint

import json
import datetime

from supermeeting import meeting
from supermeeting.views import manage
from ..untils.dbset import SQLHelper
from ..forms.form import LoginForm

del_room = Blueprint('del_room', __name__)

@del_room.route('/del_room',methods=['POST'],endpoint='del_meet')
def del_room_meet():
    if request.method=='POST':
        print('取消订阅')
        xrid=request.form.get('xrid')
        xtid=request.form.get('xtid')
        date=str(request.form.get('date'))
        now_user=session.get('user')[0]
        print('取消订阅',xrid,xtid,date,now_user)
        real_user_id=SQLHelper.fetch_one('select user_id from room_status where datetime=%s and room_id=%s and choice_time=%s',[date,xrid,xtid])
        print(real_user_id)
        real_user=SQLHelper.fetch_one('select name from user where id=%s',[real_user_id])
        print(real_user[0],now_user,type(real_user[0]),type(now_user))
        if real_user[0]==now_user:
            row=SQLHelper.del_rmmm('delete from boardroom.room_status where datetime=%s and room_id=%s and choice_time=%s',[date,xrid,xtid])
            ret={'stude':row,'xrid':xrid,'xtid':xtid}
            print(row,'<<<这里是返回的当前用户信息')
            return Response(json.dumps(ret))
        else:
            row=3  # 3表示不是这个用户，没权限修改别人的预定
            print(row ,'<<<这里是返回的当前用户信息')
            ret = {'stude': row}
            return Response(json.dumps(ret))