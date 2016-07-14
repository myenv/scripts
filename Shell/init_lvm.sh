 #!/bin/bash
 
 echo "- - -" > /sys/class/scsi_host/host0/scan
 
 pvcreate /dev/sdb >/dev/null 2>&1
 vgcreate datavg /dev/sdb >/dev/null 2>&1
 lvcreate -L +49.5G datavg -n lv_data >/dev/null 2>&1
 mkdir /data
 mkfs.ext3 /dev/datavg/lv_data >/dev/null 2>&1
 
 echo "/dev/datavg/lv_data     /data                   ext3    defaults        0 0" >> /etc/fstab
 mount -a




 #====================
  #!/bin/bash
 
 echo "- - -" > /sys/class/scsi_host/host0/scan
 
 pvcreate /dev/sdb >/dev/null 2>&1
 vgcreate datavg /dev/sdb >/dev/null 2>&1
 lvcreate -L +299G datavg -n lv_data >/dev/null 2>&1
 mkdir /data
 mkfs.ext4 /dev/datavg/lv_data >/dev/null 2>&1
 
 echo "/dev/datavg/lv_data     /data                   ext4    defaults        0 0" >> /etc/fstab
 mount -a
