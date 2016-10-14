#!/usr/bin/env bash

PWD=`pwd`
cd $HOME/dotfiles || exit

echo "Doing git stuff..."
git pull origin master
git submodule init --quiet && git submodule update --quiet && git submodule status

function doIt() {
  rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
    --exclude "README.md" --exclude ".gitmodules" --exclude "antigen" \
    --exclude ".private_rc" -avhc --no-perms . ~
}

function checkIt() {
  rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
    --exclude "README.md" --exclude ".gitmodules" --exclude "antigen" \
    --exclude ".private_rc" -avhcn --no-perms . ~
}

if [ "$1" = "--force" -o "$1" = "-f" ]; then
  doIt
else
  checkIt
  echo ""
  echo -n "This next step will rsync the repository dotfiles to your home directory and will overwrite existing files. Are you sure? (y/n) "
  read -n 1 REPLY
  echo ""
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt
  fi
fi
unset doIt

cd $PWD || exit
