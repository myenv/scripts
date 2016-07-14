#!/usr/bin/env python

f = file('shops.txt')
products = []
prices = []
#将商品信息从文件中读取，并转化成列表存储
for line in f.readlines():
	Format_line = line.split()
	products.append(Format_line[0])
	prices.append(Format_line[1])
salary = int(raw_input('Please input your salary: '))
while True:
	print 'Welcome,things you can buy as below: '
	#打印菜单
	for p in products:
		#获取物品在列表中的下标
		p_index = products.index(p)
		#获取同样下标的金额
		p_price = prices[p_index]
		print p,p_price
	choice = raw_input('Please input what you want to buy: ')
	#过滤掉字符串中的空格
	F_choice = choice.strip()
	if F_choice in products:
		print '\033[36;1mYes,it is in the list\033[0m'
	else:
		print '\033[36;1mSorry,it is not in the list\033[0m'
