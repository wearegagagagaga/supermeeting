from flask import Flask,request,render_template,session,redirect,Response
from dbset import SQLHelper
import json
import datetime

from wtforms import Form
from wtforms.fields import core
from wtforms.fields import html5
from wtforms.fields import simple
from wtforms import validators
from wtforms import widgets

app=Flask(__name__,template_folder='templates')
app.debug=True
app.secret_key='6666666'

@app.before_request
def process_request(*args,**kwargs):
    if request.path=='/login':
        return None
    user=session.get('user')
    if user:
        print('已验证用户')
        return None
    return redirect('/login')

class LoginForm(Form):
    user = simple.StringField(
        label='用户名',
        validators=[
            validators.DataRequired(message='用户名不能为空.'),
            validators.Length(min=2, max=18, message='用户名长度必须大于%(min)d且小于%(max)d')
        ],
        widget=widgets.TextInput(),
        render_kw={'class': 'form-control','placeholder':'用户名'}

    )
    pwd = simple.PasswordField(
        label='密码',
        validators=[
            validators.DataRequired(message='密码不能为空.'),
            validators.Length(min=2, message='用户密码长度必须大于%(min)d'),
            # validators.Regexp(regex="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}",
            #                   message='密码至少8个字符，至少1个大写字母，1个小写字母，1个数字和1个特殊字符')

        ],
        widget=widgets.PasswordInput(),
        render_kw={'class': 'form-control','placeholder':'密码'}
    )



@app.route('/login',methods=['GET','POST'],endpoint='n1')
def login():
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

@app.route('/index',methods=['GET','POST'],endpoint='n2')
def index():
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

@app.route('/logout',methods=['GET',],endpoint='n3')
def logout():
    if request.method=='GET':
        session.pop('user',None)
        return redirect('/login')

@app.route('/add',methods=['POST'],endpoint='n4')
def add():
    if request.method=='POST':
        rid=request.form.get('rid')
        tid=request.form.get('tid')
        date=request.form.get('date')
        user=session.get('user')[0]
        user_id=SQLHelper.fetch_one('select id from user where name=%s',[user])
        row=SQLHelper.add('insert into room_status(datetime,room_id,choice_time,user_id)VALUES (%s,%s,%s,%s)',[date,rid,tid,user_id])
        ret={'stude':row,'rid':rid,'tid':tid,'user':user}
        return Response(json.dumps(ret))

@app.route('/del_room',methods=['POST'],endpoint='n5')
def del_room():
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


if __name__ == '__main__':
    app.run()
