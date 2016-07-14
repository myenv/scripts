 echo "- - -" > /sys/class/scsi_host/host0/scan
 pvcreate /dev/sdc
 vgextend datavg /dev/sdc