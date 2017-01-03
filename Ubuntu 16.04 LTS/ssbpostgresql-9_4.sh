#!/bin/bash

# $ sudo sh ssbpostgresql-9_4.sh

sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
sudo apt-get install wget ca-certificates
cd ~/Documents
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install postgresql-9.4
sudo sed -i '92d' /etc/postgresql/9.4/main/pg_hba.conf
sudo sed -i '92i host    all             all             127.0.0.1/32            trust' /etc/postgresql/9.4/main/pg_hba.conf
sudo /etc/init.d/postgresql restart

# host    all             all             127.0.0.1/32            md5
# host    all             all             127.0.0.1/32            trust

# sudo -u postgres psql postgres

# set postgres password

# host    all             all             127.0.0.1/32            password

# use password for trusted networks
# use md5 for untrusted networks