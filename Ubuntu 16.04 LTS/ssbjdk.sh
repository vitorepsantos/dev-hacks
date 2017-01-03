#!/bin/bash

# $ sudo sh ssbjdk.sh

cd ~/Documents
wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/7u80-b15/jdk-7u80-linux-x64.tar.gz
tar -xf jdk-7u80-linux-x64.tar.gz
rm -f jdk-7u80-linux-x64.tar.gz
sudo mv ~/Documents/jdk1.7.0_80/ /opt/
cd ~/
sudo nano /etc/environment
# export JAVA_HOME=/opt/jdk1.7.0_80
# export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin:/bin:$JAVA_HOME/bin
sudo nano .bashrc
# add the following lines at file's end
# source /etc/environment
