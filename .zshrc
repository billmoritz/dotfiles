DOTFILES_BASE=$HOME/dotfiles
source $DOTFILES_BASE/antigen/antigen.zsh

antigen-use oh-my-zsh

if [[ "$OSTYPE" =~ "^darwin.*" ]]; then
  antigen-bundle osx
  antigen-bundle battery
  antigen-bundle sublime
  antigen-bundle brew
fi

antigen-bundle aws
antigen-bundle git
antigen-bundle bundler
antigen-bundle rake
antigen-bundle ruby
antigen-bundle rvm
antigen-bundle docker
antigen-bundle python
antigen-bundle pip
antigen-bundle screen
antigen-bundle sudo
antigen-bundle golang

antigen-bundle zsh-users/zsh-syntax-highlighting
antigen-bundle zsh-users/zsh-history-substring-search
#antigen-bundle $DOTFILES_BASE/bundles/stv

#antigen-theme $DOTFILES_BASE/themes/mgdm/mgdm.zsh-theme
antigen theme juanghurtado

antigen-apply

# Speed up compile time
export CFLAGS='-g -O2'

# Set Editor
export EDITOR='vim'

# Aliases
[ -f .aliases ] && source .aliases

# Functions
[ -f .functions ] && source .functions

# SSH Keys
[ -f .sshkeys ] && source .sshkeys
# ssh-add -l | egrep "id_rsa_billmoritz" &> /dev/null ||  ssh-add $HOME/.ssh/id_rsa_billmoritz

# Local Path
export PATH=$PATH:$HOME/bin

# Setup Go
mkdir -pv $HOME/code/go
export GOPATH=$HOME/code/go
export PATH=$PATH:$GOPATH/bin

# Setup Ruby
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="/usr/local/sbin:$PATH"

# Setup Docker
eval "$(docker-machine env default)"

# pyenv init
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# Setup VIM
mkdir -pv ~/.vim/_backup
mkdir -pv ~/.vim/_temp
