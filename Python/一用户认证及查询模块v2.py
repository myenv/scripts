#!/usr/bin/env python
#coding:utf-8

try:      
        while True:
                Quit = "No"
                Name = raw_input("请输入用户名: ")
                if Name == "Yangjiong":
                        Password = raw_input("请输入密码: ")
                while Password <> "Hello":
                        Password = raw_input("请输入密码: ")
                else:
                        print '------------'
                        print "登陆成功"
                        print '------------\n'
                        while True:
                                Status = "No"
                                Search_name = raw_input("\033[1;32;40m请输入查询信息： \033[0m")
                                File = file('User.txt')
                                if Search_name == "":
                                        print "用户名不能为空\n"
                                while True:
                                        ReadText = File.readline()
                                        if len(ReadText) == 0:
                                                File.close()
                                                break
                                        if Search_name == "q":
                                                Quit = "Yes"
                                                break
                                        if Search_name in ReadText and Search_name <> "":
                                                print ReadText
                                                Status = "Yes"
                                if Status != "Yes" and Search_name <> "q":
                                        print "用户不存在"
                                if Quit == "Yes":
                                        break
except  KeyboardInterrupt:
        print '...'
