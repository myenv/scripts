#!/usr/bin/env python


f = file('User.txt')
while True:
	s = f.read()
	if 'User06' in s:
		s.replace('User06','Yang')
	    f.write(s)
f.close()