#!/usr/bin/env bash

# Get sudo warmed up for other installs
sudo true

xcode-select --install

# Make sure we're current
brew update && brew upgrade

# Tools
brew cask install vagrant vagrant-manager

brew install python2
brew install python3

pip install virtualenv
pip install virtualenvwrapper

pip install -U pip
source /usr/local/bin/virtualenvwrapper.sh

for brewpkg in wget ncdu htop ncdu jq shellcheck letsencrypt direnv; do
  brew install $brewpkg
done
brew install --with-stoken --with-oath-toolkit openconnect
brew install heroku/brew/heroku

# Docker
brew cask install virtualbox-extension-pack
brew install docker docker-machine docker-compose
docker-machine create --driver virtualbox default

# Services
brew install rabbitmq memcached mysql
ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents

# Pip
pip install ansible
pip install pylama
pip install pylint
pip install pydocstyle
pip install boto
pip install sys
pip install requests

# Ansible
ansible-galaxy install danbohea.atom
