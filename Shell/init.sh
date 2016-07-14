cd /etc/yum.repos.d/
wget http://10.0.7.40/yum/lan.repo
yum makecache

cd ~ 
wget http://10.0.7.40/scripts/init_lvm.sh
sh ~/init_lvm.sh
rm -rf ~/init_lvm.sh

