#!/bin/bash
#checkpackavailable.sh

sudo apt-get install devscripts
apt-cache madison <package-name>

# ex. apt-cache madison pgadmin3
