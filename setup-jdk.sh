#!/bin/bash
sudo apt-get update
sudo apt-get upgrade
echo 'JAVA_HOME=\"/opt/jdk1.8.0_111\"' >> /etc/environment
echo 'export PATH=$PATH:$JAVA_HOME/bin' >> ~/.bashrc
source .bashrc
reboot
java -version
