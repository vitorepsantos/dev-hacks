#!/bin/bash

# $ sudo sh ssbjdk.sh

cd /opt
sudo wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/7u80-b15/jdk-7u80-linux-x64.tar.gz
sudo tar -xf jdk-7u80-linux-x64.tar.gz
sudo rm -f jdk-7u80-linux-x64.tar.gz

sudo nano /etc/environment
# add JAVA_HOME="/opt/jdk1.7.0_80"

sudo nano ~/.bashrc 
# add export PATH=$PATH:$JAVA_HOME/bin

# reboot
# test java -version
