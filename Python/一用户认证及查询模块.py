#!/usr/bin/env python
#coding:utf-8


while True:#第一个while 循环
        Quit = "No"#设定退出计数器
        Name = raw_input("请输入用户名: ")#接收用户输入
        if Name == "Yangjiong":#判断如果Name结果等于Yangjiong则执继续执行
                Password = raw_input("请输入密码: ")#接收密码输入
                while Password <> "Hello":#如果密码不是Hello
                        Password = raw_input("请输入密码: ")#重复提示输入密码
                else:#否则打印登陆成功信息
                        print '------------'
                        print "登陆成功"
                        print '------------\n'
                        while True:#第二个while 循环
                                Status = "No"#设置状态计数器
                                Search_name = raw_input("请输入查询信息： ")#接收查询输入
                                File = file('User.txt')#打开文件
                                if Search_name == "":#如果查询输入为空时提示
                                        print "用户名不能为空\n"                                     
                                while True:#第三个while 循环
                                        ReadText = File.readline()#读取行
                                        if len(ReadText) == 0:#如果读完
                                                File.close()#关闭文件
                                                break#退出第三层层while循环
                                        if Search_name == "q":#如果查询输入q时
                                                Quit = "Yes"#将退出计数器状态置为Yes
                                                break#退出第三层层while循环
                                        if Search_name in ReadText and Search_name <> "":#如果用户输入的内容在读取行中匹配的到并且输入不为空时，输入为空时配置回车符为\n也会认为是有效输入。
                                                print ReadText#打印当前行
                                                Status = "Yes"#将状态计数器置为Yes
                                if Status != "Yes" and Search_name <> "q":#如果状态符不为Yes或用户输入q时
                                        print "用户不存在"
                                if Quit == "Yes":#如果退出计数器为Yes时
                                        break
        else:print "用户名错误，请重新输入"#判断如果Name结果不等于Yangjiong则执继续执行
        if Quit == "Yes":#如果退出计数器等于Yes时
                break#退出第一层while
