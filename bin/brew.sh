#!/usr/bin/env zsh

# Get sudo warmed up for other installs
sudo true

# Make sure we're current
brew update && brew upgrade

brew install ncdu
brew install htop

brew cask install virtualbox-extension-pack
VBoxManage hostonlyif remove vboxnet0

brew install docker
brew install docker-machine
brew install docker-compose
docker-machine create --driver virtualbox default

brew install rabbitmq
brew install memcached
brew install mysql
ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents
