#!/bin/bash
#basic
sudo apt-get update
sudo apt-get upgrade

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
