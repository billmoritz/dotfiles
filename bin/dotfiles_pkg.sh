#!/usr/bin/env zsh

# Get sudo warmed up for other installs
sudo true

# Make sure we're current
brew update && brew upgrade

# Tools
brew cask install vagrant vagrant-manager
brew install wget ncdu htop ncdu jq spellcheck
brew install --with-stoken --with-oath-toolkit openconnect

# Docker
brew cask install virtualbox-extension-pack
brew install docker docker-machine docker-compose
docker-machine create --driver virtualbox default

# Services
brew install rabbitmq memcached mysql
ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents

# Pip
pip install pylama
