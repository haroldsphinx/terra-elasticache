#!/bin/bash

sudo apt-get update
sudo apt-get install -y redis-tools

# To Do

# Install AWS CLI
curl -O https://bootstrap.pypa.io/get-pip.py
sudo apt install -y python3
python3 get-pip.py --user
export PATH=~/.local/bin:$PATH
source ~/.bash_profile
pip3 install awscli --upgrade --user


# setup aws cli with the company keys and credentials