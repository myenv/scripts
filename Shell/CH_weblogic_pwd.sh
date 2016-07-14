#!/bin/bash
#author:wjf
#date:2015/05/19
#经在wls1036上测试可用
 
v_domain_home="/weblogic/Oracle/Middleware/user_projects/domains/gyhr_domain"
#------------------域的主目录
v_wls_home="/weblogic/Oracle/Middleware/wlserver_10.3"
#------------------wls主目录
v_admin_server="gyhr_AdminSrv"
#------------------管理服务器名
v_curr_date=`date +%Y%m%d`
 
echo "请输入更改后的用户名"
read v_username
echo "请输入更改后的密码"
read v_password
 
echo "备份${v_domain_home}/security/DefaultAuthenticatorInit.ldift文件到"
echo "    DefaultAuthenticatorInit.ldift_${v_curr_date}.bak"
cp ${v_domain_home}/security/DefaultAuthenticatorInit.ldift ${v_domain_home}/security/DefaultAuthenticatorInit.ldift_${v_curr_date}.bak
 
cd ${v_domain_home}/security/
java -classpath ${v_wls_home}/server/lib/weblogic.jar weblogic.security.utils.AdminAccount ${v_username} ${v_password} .
 
if [ -d ${v_domain_home}/servers/${v_admin_server}/data -a ! -d ${v_domain_home}/servers/${v_admin_server}/data_${v_curr_date}.bak/ ]
        then
                echo "备份${v_domain_home}/servers/${v_admin_server}/data目录到data_${v_curr_date}.bak"
                mv ${v_domain_home}/servers/${v_admin_server}/data/  ${v_domain_home}/servers/${v_admin_server}/data_${v_curr_date}.bak/
fi
 
mkdir -p ${v_domain_home}/servers/${v_admin_server}/security
echo -ne "username=${v_username}\npassword=${v_password}" > ${v_domain_home}/servers/${v_admin_server}/security/boot.properties
 
echo "重设密码完成"