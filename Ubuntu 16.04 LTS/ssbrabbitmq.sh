#!/bin/bash

# $ sudo sh ssbrabbitmq.sh

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
