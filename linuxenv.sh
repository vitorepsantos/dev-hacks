#!/bin/bash

sudo apt-get update
sudo apt-get upgrade

#dev
apt-get install git
sudo apt-get install keepassx

#virtualbox
wget http://download.virtualbox.org/virtualbox/5.1.12/VirtualBox-5.1.12-112440-Linux_amd64.run -O virtualbox.run
chmod +x virtualbox.run
sudo ./virtualbox.run
apt-get update
apt-get upgrade
apt-get install build-essential module-assistant
apt-get install virtualbox-guest-x11

#python
sudo apt-get install virtualenv python-pip

#java
cd /opt/
sudo wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u111-b14/jdk-8u111-linux-x64.tar.gz -P /opt/
sudo tar -xf jdk-8u111-linux-x64.tar.gz
sudo rm -f jdk-8u111-linux-x64.tar.gz
sudo nano /etc/environment
# PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin:/bin"
# JAVA_HOME="/opt/jdk1.8.0_111"
sudo nano .bashrc
# add the following lines at file's end
# export PATH=$PATH:$JAVA_HOME/bin
source .bashrc
# test
# java -version

# reboot
# test java -version

#pgadmin
sudo apt-get install wget ca-certificates 
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install pgadmin3=1.22.0-1 pgadmin3-data=1.22.0-1

#postgress
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
sudo apt-get install wget ca-certificates
cd ~/Documents
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install postgresql-9.4
sudo sed -i '93i host    all             postgres             127.0.0.1/32            trust' /etc/postgresql/9.4/main/pg_hba.conf
sudo /etc/init.d/postgresql restart

# host    all             all             127.0.0.1/32            md5
# host    all             all             127.0.0.1/32            trust

# sudo -u postgres psql postgres

# set postgres password

# host    all             all             127.0.0.1/32            password

# use password for trusted networks
# use md5 for untrusted networks

#rabbitmq
# install
sudo sh -c 'echo "deb http://www.rabbitmq.com/debian/ stable  main" > /etc/apt/sources.list.d/rabbitmq.list' 
# sudo sh -c 'echo "deb http://www.rabbitmq.com/debian/ testing  main" > /etc/apt/sources.list.d/rabbitmq.list' 
sudo wget -O- https://www.rabbitmq.com/rabbitmq-release-signing-key.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install rabbitmq-server

sudo service rabbitmq-server start

# management plugin
sudo rabbitmq-plugins enable rabbitmq_management
sudo wget http://localhost:15672/cli/rabbitmqadmin -P /opt/rabbitmqadmin

cd /opt/rabbitmqadmin
sudo chmod +x rabbitmqadmin

# declare queue
# ./rabbitmqadmin -H 127.0.0.1 -P 15672 -u guest -p guest declare queue name=<queue_name>