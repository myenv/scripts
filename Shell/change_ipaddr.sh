#!/bin/bash

#修改IP及HOSTNAME

 ETHCONF=/etc/sysconfig/network-scripts/ifcfg-eth0
 HOSTS=/etc/hosts
 NETWORK=/etc/sysconfig/network
 DIR=/root/backup/`date +%Y%m%d` 
 NETMASK=255.255.255.0
 
 function Change_ip () 
{ 
if [ ! -d $DIR ];then
 mkdir -p $DIR   
fi

 echo "Now Change ip address ,Doing Backup Interface eth0"
 cp $ETHCONF $DIR 
 
 read -p "Please insert ip Address:" IPADDR 
 sed -i "s/IPADDR=.*/IPADDR=$IPADDR/g" $ETHCONF 
 echo "This IP address Change success !"
 echo "nameserver  192.168.199.2" >> /etc/resolv.conf
 #Version < RHEL7
 #rm -rf /etc/udev/rules.d/70-persistent-net.rules
}

function Change_hosts () 
{ 
  
if [ ! -d $DIR ];then
 mkdir -p $DIR 
fi
  
 cp $HOSTS $DIR 
 echo "Please insert IP and HOSTNAME"
 read -p "Please insert ip address": IPADDR 
 read -p "Please insert HOSTNAME": HOSTNAMES
   
if [ -n $IPADDR -a -n $HOSTNAMES ];then
 echo $IPADDR  $HOSTNAMES >> $HOSTS
 sed -i "s/HOSTNAME=.*/HOSTNAME=$HOSTNAMES/g" $NETWORK
 echo "This hosts change success "
else
 echo "This $host IS Exist .........."
fi

}


 PS3="Please Select Menu": 
 select i in "Change_ip" "Change_hosts" "Reboot" "Quit" 
  
do
case $i in
  Change_ip ) 
  Change_ip 
;; 
  Change_hosts ) 
  Change_hosts 
;; 
  Reboot )
  sync;sync;sync;init 6
;; 
  Quit )
  exit 0
;;
  *) 
  echo
  echo "Please Insert $0: Change_ip(1)|Change_hosts(2)"
  echo
;; 
esac 
done

