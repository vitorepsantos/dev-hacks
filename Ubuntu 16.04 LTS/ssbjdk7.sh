#!/bin/bash

# $ sudo sh ssbjdk7.sh

cd /opt/
sudo wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/7u80-b15/jdk-7u80-linux-x64.tar.gz -P /opt/
tar -xf jdk-7u80-linux-x64.tar.gz
rm -f jdk-7u80-linux-x64.tar.gz
sudo nano /etc/environment
# PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin:/bin"
# JAVA_HOME="/opt/jdk1.7.0_80"
sudo nano .bashrc
# add the following lines at file's end
# export PATH=$PATH:$JAVA_HOME/bin
source .bashrc
# test
# java -version
