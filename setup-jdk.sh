#!/bin/bash
sudo apt-get update
sudo apt-get upgrade

sudo tar -xf jdk-8u111-linux-x64.tar.gz
sudo rm -f jdk-8u111-linux-x64.tar.gz
sudo nano /etc/environment
# PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin:/bin"
# JAVA_HOME="/opt/jdk1.8.0_111"
sudo nano .bashrc
# export PATH=$PATH:$JAVA_HOME/bin
source .bashrc
java -version
reboot
java -version
