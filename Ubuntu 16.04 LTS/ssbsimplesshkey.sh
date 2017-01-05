#!/bin/bash

# Simpler way to get a public SSH Key (check 'ssh-keygen' parameters to improve your key)

# $ sudo sh ssbsimplesshkey.sh

mkdir $HOME/.ssh
cd ~/.ssh
ssh-keygen -t rsa
cat ~/.ssh/id_rsa.pub


# eval "$(ssh-agent -s)"
# add ssh-key to ssh agent
# ssh-add ~/.ssh/id_rsa