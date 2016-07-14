#!/bin/bash
#author:wjf
#date:2015/05/19
#����wls1036�ϲ��Կ���
 
v_domain_home="/weblogic/Oracle/Middleware/user_projects/domains/gyhr_domain"
#------------------�����Ŀ¼
v_wls_home="/weblogic/Oracle/Middleware/wlserver_10.3"
#------------------wls��Ŀ¼
v_admin_server="gyhr_AdminSrv"
#------------------�����������
v_curr_date=`date +%Y%m%d`
 
echo "��������ĺ���û���"
read v_username
echo "��������ĺ������"
read v_password
 
echo "����${v_domain_home}/security/DefaultAuthenticatorInit.ldift�ļ���"
echo "    DefaultAuthenticatorInit.ldift_${v_curr_date}.bak"
cp ${v_domain_home}/security/DefaultAuthenticatorInit.ldift ${v_domain_home}/security/DefaultAuthenticatorInit.ldift_${v_curr_date}.bak
 
cd ${v_domain_home}/security/
java -classpath ${v_wls_home}/server/lib/weblogic.jar weblogic.security.utils.AdminAccount ${v_username} ${v_password} .
 
if [ -d ${v_domain_home}/servers/${v_admin_server}/data -a ! -d ${v_domain_home}/servers/${v_admin_server}/data_${v_curr_date}.bak/ ]
        then
                echo "����${v_domain_home}/servers/${v_admin_server}/dataĿ¼��data_${v_curr_date}.bak"
                mv ${v_domain_home}/servers/${v_admin_server}/data/  ${v_domain_home}/servers/${v_admin_server}/data_${v_curr_date}.bak/
fi
 
mkdir -p ${v_domain_home}/servers/${v_admin_server}/security
echo -ne "username=${v_username}\npassword=${v_password}" > ${v_domain_home}/servers/${v_admin_server}/security/boot.properties
 
echo "�����������"