source /opt/homebrew/share/antigen/antigen.zsh

antigen use oh-my-zsh

if [[ "$OSTYPE" =~ ^darwin.* ]]; then
  antigen bundle macos
  antigen bundle battery
  antigen bundle sublime
  antigen bundle brew
fi

# antigen bundle aws
antigen bundle battery
antigen bundle bundler
antigen bundle command-not-found
antigen bundle dotenv
antigen bundle docker
antigen bundle docker-compose
antigen bundle droplr
antigen bundle gem
antigen bundle git
antigen bundle github
antigen bundle git-extras
antigen bundle golang
antigen bundle heroku
antigen bundle minikube
antigen bundle pip
antigen bundle pyenv
antigen bundle python
antigen bundle rake
antigen bundle rbenv
antigen bundle redis-cli
antigen bundle ruby
antigen bundle screen
antigen bundle terraform

antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-syntax-highlighting

antigen bundle owenthereal/ccat

# use starship if installed
if which starship >/dev/null; then
  eval "$(starship init zsh)"
else
  antigen theme denysdovhan/spaceship-prompt
  export SPACESHIP_TIME_SHOW=true
  export SPACESHIP_EXIT_CODE_SHOW=true
  export SPACESHIP_EXEC_TIME_ELAPSED=0
  export SPACESHIP_KUBECTL_SHOW=true
fi

antigen apply

# Speed up compile time
export CFLAGS='-g -O2'

# Set Editor
if which code >/dev/null; then
  export EDITOR="$(which code) --wait"
else
  export EDITOR='vim'
fi

# SSH Keys
[ -f .ssh/.ssh-add ] && source .ssh/.ssh-add

# Local Path
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.local/bin

# Setup Go
mkdir -pv $HOME/code/go
export GOPRIVATE=*.salesforce.com
export GOPATH=$HOME/code/go
export PATH=$PATH:$GOPATH/bin

# Setup Ruby
export PATH="/usr/local/sbin:$PATH"
eval "$(rbenv init -)"

# Homebrew cask path
# eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="$PATH:$HOME/local/bin"

# pyenv init
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

if which pyenv-virtualenv-init >/dev/null; then eval "$(pyenv virtualenv-init -)"; fi

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
if [ -f .private_rc.gpg ]; then
  PRIVATE_RC=$(gpg -d -q .private_rc.gpg)
  eval $PRIVATE_RC
fi

[ -f .private_rc ] && echo "WARNING: .private_rc is unencrypted"

fortune | cowsay | lolcat

# Print outdated brew packages on login
[ -f motd.txt ] && cat motd.txt

source <(kubectl completion zsh)
source <(minikube completion zsh)
source <(gh completion -s zsh)
source <(yq shell-completion zsh)

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

test -e "${HOME}/bin/start-watchman.sh" && "${HOME}/bin/start-watchman.sh" >/dev/null

export ANSIBLE_VAULT_PASSWORD_FILE=~/.vault_pass.txt
export ANSIBLE_NOCOWS=1

export SDKMAN_OFFLINE_MODE=false
export PATH="/usr/local/opt/curl-openssl/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
