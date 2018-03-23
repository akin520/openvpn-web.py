#!/usr/bin/env python
#coding:utf-8

#SCREEN -S openvpn /root/webapps/openvpn/run.sh &
import web
from config import settings
import hashlib
from datetime import datetime

db = settings.db
admin = settings.admin

urls = (
    '/','Index',
    '/new','New',
    '/del/(.*)','Delete',
    '/edit/(.*)','Edit',
    '/logs$','Logs',
    '/login','login',
    '/logout','logout',

)

web.config.debug = False
app = web.application(urls, globals())
session = web.session.Session(app, web.session.DiskStore('sessions'))


render = web.template.render('templates/',cache=False)


def logining():
    try:
        if session.logged_in == False:
            raise web.seeother('/logout')       
    except:
        raise web.seeother('/logout')

class login:
    def GET(self):
        #cookies=web.cookies()
        #print cookies
        
        print session.logged_in
        if session.logged_in == True:
            raise web.seeother('/')
        else:
            return render.login()
    
    def POST(self):
        i = web.input()
        username = i.get('username')
        password = i.get('password')
        loginuser=(username,password)
        check = admin == loginuser
        print check
        if check:
            session.logged_in = True
            #web.setcookie("username",base64.b64encode(username))
            #web.setcookie("password",base64.b64encode(passwd))
            raise web.seeother('/')
        else:
            return '''<script>alert('user and password error');history.back();</script>'''
        

class Index:
    def GET(self):
        logining()
        userList = db.query('select * from user where active=1')
        return render.index(userList)

class New:
    def GET(self):
        logining()
        raise web.seeother('/')
           
    def POST(self):
        i = web.input()
        username = i.get('username')
        password = i.get('password')
        if (not username) or (not password):
            return '''<script>alert('用户或密码没有填写');history.back();</script>'''
        secure=hashlib.md5(password).hexdigest()
        #print secure
        try:
            db.insert('user', name=username, password=secure)
            raise web.seeother('/')
        except:
            return '''<script>alert('插入有重名或插入异常！');history.back();</script>'''
        

class Delete:
    def GET(self,id):
        logining()

        try:
            #下面一个是真删除，一个是假删除
            #db.delete('user', where='id=$id', vars=locals())
            print id
            db.update('user', active=0, where='id=$id', vars=locals())
            raise web.seeother('/')
        except:
            return '''<script>alert('删除错误');history.back();</script>'''              

class Edit:
    def GET(self,id):
        logining()
        
        u = db.query('select * from user where id = %s' %id)
        s = u[0]
        print s
        return render.edit(s)
    
    def POST(self,id):
        i = web.input()
        password = i.get('password')
        if not password:
            return '''<script>alert('请输入密码');history.back();</script>'''
        secure=hashlib.md5(password).hexdigest()
        try:
            db.update('user', password=secure, where='id=$id', vars=locals())
            raise web.seeother('/')
        except:
            return '''<script>alert('错误');history.back();</script>''' 

class Logs:
    def GET(self):
        logining()
        
        log = db.query('SELECT * FROM login_log ORDER BY id DESC LIMIT 15')
        return render.logs(log)


class logout:
    def GET(self):
        session.logged_in = False
        #web.setcookie("username",'',-1)
        #web.setcookie("password",'',-1)
        raise web.seeother("/login")


if __name__ == "__main__":
    app.run()