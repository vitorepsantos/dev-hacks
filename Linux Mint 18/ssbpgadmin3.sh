#!/bin/bash

# $ sudo sh ssbpgadmin3.sh

sudo apt-get install wget ca-certificates 
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install pgadmin3=1.22.0-1 pgadmin3-data=1.22.0-1
