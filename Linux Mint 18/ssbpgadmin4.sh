#!/bin/bash

# $ sudo sh ssbpgadmin4.sh

cd ~/Documents
wget https://ftp.postgresql.org/pub/pgadmin3/pgadmin4/v1.1/source/pgadmin4-1.1.tar.gz
tar -xf pgadmin4-1.1.tar.gz
rm -f pgadmin4-1.1.tar.gz
sudo mv pgadmin4-1.1/ /opt/
sh -c 'echo "SERVER_MODE = False" > /opt/pgadmin4-1.1/web/config_local.py'

sudo apt-get install python-pip
sudo pip install --upgrade pip
sudo pip install -U pip setuptools
sudo pip install Flask
sudo pip install flask-security flask-sqlalchemy
sudo pip install Flask-Babel
sudo pip install django-htmlmin
sudo pip install python-dateutil

python setup.py
