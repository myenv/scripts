#!/usr/bin/env python
#coding:utf-8

GZ = int(raw_input("请输入您的个人工资："))
WP = ['iphone','cat','book','tea']
JG = [5400,200000,30,15]

if GZ > 0:
        print "ID\t\t物品\t\t价格"
        print "------------------------------------"
        for i in range(0,4):
                print "%d\t\t%s\t\t%d" % (i+1,WP[i],JG[i])
                LIST = []
                Quit = 'NO'
                Sum = 0
        while Quit == 'NO':
                ID = int(raw_input("请选择物品ID："))
                Yue = GZ
                if ID > 0 and ID < 5:
                        Sum = Sum + JG[ID-1]
                        LIST.append(WP[ID-1])
                        if Sum < GZ:
                                print "物品总价为%d,您的购物清单为%s,您的余额为%d" % (Sum,LIST,GZ - Sum)
                                Status = raw_input("是否继续购物(Y/N)")
                                if Status == 'Y' and Sum < GZ:
                                        Quit = 'NO'
                                else:
                                        Quit = 'Yes'
                        else:
                                Sum = Sum - JG[ID-1]
                                LIST.pop()
                                print "截至目前物品总价为%d,您的余额为%d" % (Sum,GZ - Sum)
                                print "购物清单为： "
                                if LIST.count('iphone') > 0:print "iphone * %d" % LIST.count('iphone')
                                if LIST.count('cat') > 0:print "cat * %d" % LIST.count('cat')
                                if LIST.count('book') > 0:print "book * %d" % LIST.count('book')
                                if LIST.count('tea') > 0:print "tea * %d" % LIST.count('tea')

                                print "余额不足"
                                Quit = 'Yes'
                                break
                else:
                        print "选择物品信息有误！"
                        #Quit = 'Yes'
                        #break

