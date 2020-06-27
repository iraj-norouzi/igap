#!/bin/bash
echo "nameserver 178.22.122.100" > /etc/resolv.conf
echo "nameserver  185.51.200.2" >> /etc/resolv.conf
echo "nameserver  8.8.8.8" >> /etc/resolv.conf
yum -y install epel-release
yum update -y
#Disable selinux
sed -i 's/enforcing/disabled/g' /etc/selinux/config
setenforce 0

#Disable firewalld.service
systemctl stop firewalld
systemctl disable firewalld

#Install screen
yum -y install wget screen net-tools sysstat iftop bmon tcpdump bwm-ng

systemctl start sysstat
systemctl enable sysstat

#Install docker

yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine -y

yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2


yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

yum install -y docker-ce docker-ce-cli containerd.io
systemctl start docker
systemctl enable docker
systemctl status docker
docker -v


curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose


echo "     #######################################################################" 	> /etc/ssh/sshd-banner
echo "     #                   Welcome to iGap Messenger                         #" 	>> /etc/ssh/sshd-banner
echo "     #                                                                     #" 	>> /etc/ssh/sshd-banner
echo "     #            All connections are monitored and recorded               #" 	>> /etc/ssh/sshd-banner
echo "     #                                                                     #" 	>> /etc/ssh/sshd-banner
echo "     #     Disconnect IMMEDIATELY if you are not an authorized user!       #" 	>> /etc/ssh/sshd-banner    
echo "     #######################################################################" 	>> /etc/ssh/sshd-banner
echo -e " _  _____                                                                  "	>> /etc/ssh/sshd-banner   
echo -e "(_)/ ____|                                                                 "	>> /etc/ssh/sshd-banner
echo -e " _| |  __  __ _ _ __    _ __ ___   ___  ___ ___  ___ _ __   __ _  ___  ___ "	>> /etc/ssh/sshd-banner
echo -e "| | | |_ |/ _| | |_ \  | |_ | _ \ / _ \/ __/ __|/ _ \ |_ \ / _| |/ _ \ |__|" 	>> /etc/ssh/sshd-banner
echo -e "| | |__| | (_| | |_) | | | | | | |  __/\__ \__ \  __/ | | | (_| |  __/ |   " 	>> /etc/ssh/sshd-banner
echo -e "|_|\_____|\__,_| .__/  |_| |_| |_|\___||___/___/\___|_| |_|\__, |\___|_|   " 	>> /etc/ssh/sshd-banner
echo -e "               | |                                          __/ |          " 	>> /etc/ssh/sshd-banner
echo -e "               |_|                                         |___/           " 	>> /etc/ssh/sshd-banner
echo -e " 		                                                            "	>> /etc/ssh/sshd-banner

sed -i 's/\#Banner none/Banner \/etc\/ssh\/sshd-banner/g' /etc/ssh/sshd_config 
timedatectl set-ntp yes
timedatectl set-timezone Asia/Tehran
echo "UseDNS no" >>/etc/ssh/sshd_config
echo "UsePAM no" >>/etc/ssh/sshd_config
systemctl restart sshd
