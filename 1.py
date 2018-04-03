import datetime
from dbset import SQLHelper
# from flask import session
# dt = datetime.datetime.today().strftime('%Y/%m/%d')
# room_status = SQLHelper.fetch_all('select room_id,choice_time,user.name from room_status left join user on user.id=room_status.user_id where datetime=%s', [dt])
# # room_status = SQLHelper.fetch_all('select room_id,choice_time,user.name from room_status LEFT join user on user.id=room_status.user_id', [])
# room_dict = {}
# # ==================================
# room_dt={1:{'time':{10:'周杰伦',11:'蔡依林'}}}
#
# print(room_status)
# # for item in room_status:
# #     if room_dict.get(item[0]):
# #         room_dict[item[0]]['time'][item[1]]=item[2]
# #     else:
# #         room_dict[item[0]] = {'time': {item[1]:item[2]}}
# # print('room_dict>>>')
# # print(room_dict)
# # a={10: 3, 11: 2}
# # for i in a:
# #     b=a[i]
# #     print(i,b)
#
# row=SQLHelper.del_rmmm('delete from boardroom.room_status where room_id=2',[])
# print(row)

# //                    $(that).parent().html(' <button class="ding" rid={{item.0}} tid={{t.0}}>可预订</button>')

# //                    $(that).parent().html('<button class="del_rm" xrid={{item.0}} xtid={{t.0}}><strong>{{room_dict[item.0]["time"][t.0]}}已预订</strong></button>')
dt =datetime.datetime.today().strftime('%Y/%m/%d')
print(dt)