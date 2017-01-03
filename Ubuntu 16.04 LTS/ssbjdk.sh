#!/bin/bash

# $ sudo sh ssbjdk.sh

cd ~/Documents
wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/7u80-b15/jdk-7u80-linux-x64.tar.gz
tar -xf jdk-7u80-linux-x64.tar.gz
rm -f jdk-7u80-linux-x64.tar.gz
sudo mv ~/Documents/jdk1.7.0_80/ /opt/
cd ~/
sudo nano .bachrc
# add the following lines at file's end
# JAVA_HOME=/opt/jdk1.7.0_80
# export JAVA_HOME
# PATH=$PATH:$JAVA_HOME
