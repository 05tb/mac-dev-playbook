#!/usr/bin/env bash

xcode-select --install
sudo easy_install pip
sudo pip install ansible
cd ~/Documents/git-repos/
mkdir mac-setup && cd mac-setup
git clone https://github.com/05tb/mac-dev-playbook.git
cd mac-dev-playbook
git checkout personal
ansible-galaxy install -r requirements.yml
sed -i "" 's/- which/# - which/' roles/gantsign.visual-studio-code-extensions/vars/pkg-mgr/default.yml
sudo chown -R $(whoami) /usr/local/lib/pkgconfig
chmod u+w /usr/local/lib/pkgconfig
ansible-playbook main.yml -i inventory -K
