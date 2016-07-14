# -*- coding: utf-8 -*-

NAME = raw_input('请输入用户名： ')
PASS = raw_input('请输入密码： ')

if NAME == '':
    print '用户名不能为空'
elif PASS == '':
    print '密码不能为空'
elif len(PASS) < 6:
    print '密码不能小于6位字符串'
else:
    print '你符合注册规范'
