#!/bin/bash

export VER="1.6.6"

## apt update
apt update -y
sudo apt -y upgrade
python3 -V

## virtual environment
## https://www.digitalocean.com/community/tutorials/how-to-install-python-3-and-set-up-a-programming-environment-on-ubuntu-20-04-quickstart

sudo apt install build-essential libssl-dev libffi-dev python3-dev -y
sudo apt install -y python3-venv
cd
python3 -m venv venv1
source venv1/bin/activate

## Install packer
mkdir packer && cd packer
wget https://releases.hashicorp.com/packer/${VER}/packer_${VER}_linux_amd64.zip
apt install unzip
unzip packer_${VER}_linux_amd64.zip
sudo mv packer /usr/local/bin
packer version

## Install HubFlow
## https://datasift.github.io/gitflow/TheHubFlowTools.html

cd
mkdir hf && cd hf
git clone https://github.com/datasift/gitflow
cd gitflow
sudo ./install.sh
sudo git hf upgrade

## git hf help
## https://datasift.github.io/gitflow/GitFlowForGitHub.html
