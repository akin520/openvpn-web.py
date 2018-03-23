#!/usr/bin/env python
#coding:utf-8
import web

db = web.database(dbn='mysql', host='127.0.0.1', db='openvpn', user='root', pw='')
admin = ('admin', 'akin.com@vpn')
