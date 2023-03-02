export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins
plugins=(
  vi-mode
  git
  docker
  node
  npm
  gradle
  mvn
  aws
  kubectl
  terraform
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Source
source $ZSH/oh-my-zsh.sh

# Aliases
alias vi='nvim'
alias vim='nvim'
alias dis='docker images'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias gbv='git branch -v'
alias ll='ls -lGah'
alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias dcub='docker-compose up --build'
alias drmiu='docker rmi $(docker images | grep "^<none>" | awk "{print $3}")'
alias ave='aws-vault exec'
alias avde='aws-vault --debug exec'
alias avl='aws-vault login'
alias tf='terraform'
alias abnt='setxkbmap -model abnt2 -layout br -variant ,abnt2'
alias path='tr ":" "\n" <<< "$PATH"'

# Variables
export WORKSPACE=$HOME/workspace
export DOTFILES=$HOME/dotfiles
export GOPATH=$HOME/go

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
. $HOME/.asdf/plugins/java/set-java-home.zsh

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Golang
export PATH=$PATH:$GOPATH/bin
