rm $(ll | grep -i zgw | awk '{print $9}') 或 ll | grep -i zgw | awk '{print $9}' | xargs rm

cat .ssh/id_rsa.pub | ssh -p 9876 root@192.168.10.46 "mkdir -p /home/software/.ssh ; cat >> /home/software/.ssh/authorized_keys ; chown -R software.software /home/software/.ssh"

function To46 () {     
	scp -P 9876 $1 software@192.168.10.46:/home/software/ 
	}
	
function Copy46 () {     
	scp -P 9876  software@192.168.10.46:/home/software/$1 . 
	}

function login46 () {
	ssh -p 9876 software@192.168.10.46
	}

function ls46 () {
        ssh -p 9876 software@192.168.10.46 "ls ~"
        }

		
function  AddPC ()
{
	read -p "Please insert ip address": IPADDR 
	read -p "Please insert HOSTNAME": HOSTNAMES
	if [ -n $IPADDR -a -n $HOSTNAMES ];then
		echo $IPADDR  $HOSTNAMES >> /etc/hosts
		ssh-copy-id -i ~/.ssh/id_rsa.pub $HOSTNAMES
		echo "This vm add success "
	else
		echo "This $host IS Exist .........."
	fi
}