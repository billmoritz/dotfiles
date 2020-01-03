source /usr/local/share/antigen/antigen.zsh

antigen use oh-my-zsh

if [[ "$OSTYPE" =~ ^darwin.* ]]; then
  antigen bundle osx
  antigen bundle battery
  antigen bundle sublime
  antigen bundle brew
fi

antigen bundle aws
antigen bundle git
antigen bundle bundler
antigen bundle battery
antigen bundle droplr
antigen bundle rake
antigen bundle rbenv
antigen bundle ruby
antigen bundle gem
antigen bundle docker
antigen bundle docker-compose
antigen bundle pyenv
antigen bundle python
antigen bundle pip
antigen bundle screen
antigen bundle terraform
antigen bundle redis-cli
antigen bundle golang
antigen bundle minikube

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search

# https://denysdovhan.com/spaceship-prompt/
antigen theme denysdovhan/spaceship-prompt
#antigen theme juanghurtado

antigen apply

# Speed up compile time
export CFLAGS='-g -O2'

# Set Editor
export EDITOR='vim'

# SSH Keys
[ -f .ssh/.ssh-add ] && source .ssh/.ssh-add

# Local Path
export PATH=$PATH:$HOME/bin

# Setup Go
mkdir -pv $HOME/code/go
export GOPATH=$HOME/code/go
export PATH=$PATH:$GOPATH/bin

# Setup Ruby
export PATH="/usr/local/sbin:$PATH"
eval "$(rbenv init -)"

# Homebrew cask path
export PATH="$PATH:$HOME/local/bin"

# pyenv init
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# Setup VIM
mkdir -pv ~/.vim/_backup
mkdir -pv ~/.vim/_temp

# Fix scp in antigen / oh-my-zsh
alias scp='noglob scp'

# Aliases
[ -f .aliases ] && source .aliases

# Functions
[ -f .functions ] && source .functions

# Private Aliases / Functions / Environment Variables
[ -f .private_rc ] && source .private_rc

fortune | cowsay | lolcat

# Print outdated brew packages on login
[ -f motd.txt ] && cat motd.txt

source <(minikube completion zsh)

# Direnv setup
eval "$(direnv hook zsh)"

# TFSwitch auto 
load-tfswitch() {
  local tfswitchrc_path=".tfswitchrc"

  if [ -f "$tfswitchrc_path" ]; then
    tfswitch
  fi
}
add-zsh-hook chpwd load-tfswitch
load-tfswitch

# SDKMan setup
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

if [ -f ~/.ansible/env.sh ]; then
    . ~/.ansible/env.sh
    # To disable ansible, comment out, but do not delete the following:
    #activate_ansible
fi

export ANSIBLE_VAULT_PASSWORD_FILE=~/.vault/key

export SDKMAN_OFFLINE_MODE=false
export PATH="/usr/local/opt/curl/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

