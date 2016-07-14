#!/bin/bash 

#批量创建账号并设置密码

for username in $(cat user.list)
do
if [ -n $username ]
then
	useradd -m $username
	echo
	echo $username"@CD_vpn" | passwd --stdin $username
	echo
	echo "User $username's password is changed!"
else
	echo "The username is null!"
fi
done


#user.list
:<<'
echo "user01 \
user01 \
user03 \
user04 \
user05 \
user06 \" > user.list
'