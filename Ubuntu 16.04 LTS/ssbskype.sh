#!/bin/bash

# $ sudo sh ssbskype.sh

echo "deb http://archive.canonical.com/ubuntu trusty partner" | sudo tee -a /etc/apt/sources.list.d/canonical_partner.list
sudo apt-get update
sudo apt-get install skype
