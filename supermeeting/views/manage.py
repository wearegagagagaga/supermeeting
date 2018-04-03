from flask import Flask,request,render_template,session,redirect,Response
from supermeeting import meeting

@meeting.before_request
def process_request(*args,**kwargs):
    if request.path=='/login':
        return None
    user=session.get('user')
    if user:
        print('已验证用户')
        return None
    return redirect('/login')
