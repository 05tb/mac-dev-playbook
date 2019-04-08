#!/usr/bin/env bash

xcode-select --install
sudo easy_install pip
sudo pip install ansible
cd ~/Documents/git-repos/
mkdir mac-setup && cd mac-setup
git clone git@github.com:05tb/mac-dev-playbook.git
cd mac-dev-playbook
ansible-galaxy install -r requirements.yml
ansible-playbook main.yml -i inventory -K