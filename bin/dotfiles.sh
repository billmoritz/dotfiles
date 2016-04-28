#!/usr/bin/env zsh

PWD=`pwd`
cd $HOME/dotfiles
RSYNCOPTS='--exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
  --exclude "README.md" --exclude ".gitmodules" --exclude "antigen" \
  --no-perms . ~'

echo "Doing git stuff..."
git pull origin master
git submodule init --quiet && git submodule update --quiet && git submodule status

function doIt() {
  rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
    --exclude "README.md" --exclude ".gitmodules" --exclude "antigen" \
    -avhc --no-perms . ~
    source .zshrc
}

function checkIt() {
  rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
    --exclude "README.md" --exclude ".gitmodules" --exclude "antigen" \
    -avhcn --no-perms . ~
}

if [ "$1" = "--force" -o "$1" = "-f" ]; then
  doIt
else
  checkIt
  echo ""
  read -q "REPLY?This next step will rsync the repository dotfiles to your home directory and will overwrite existing files. Are you sure? (y/n) "
  echo ""
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt
  fi
fi
unset doIt

cd $PWD
