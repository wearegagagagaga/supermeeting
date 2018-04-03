from flask import Flask

meeting = Flask(__name__,template_folder='templates',static_folder='static',static_url_path='/static')
meeting.debug=False
meeting.secret_key='6666666'


from .views.add import add
from .views.del_room import del_room
from .views.index import index
from .views.login import login
from .views.logout import logout



meeting.register_blueprint(add)
meeting.register_blueprint(del_room)
meeting.register_blueprint(index)
meeting.register_blueprint(login)
meeting.register_blueprint(logout)
