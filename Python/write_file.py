#!/usr/bin/env python

f = file('filew.txt','w')
for i in range(1,100):
	s = 'User%s\tIT\t100000%s\n' % (i,i)
	f.write(s)
f.flush()
f.close()
