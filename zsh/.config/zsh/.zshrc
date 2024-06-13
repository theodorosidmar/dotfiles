# Plugins
plugins=(
  vi-mode
  git
  docker
  docker-compose
  node
  npm
  gradle
  mvn
  aws
  kubectl
  kubectx
  terraform
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# oh my zsh
source $ZSH/oh-my-zsh.sh
HISTFILE=$ZDOTDIR/.zsh_history

# Aliases
alias vi='nvim'
alias vim='nvim'
alias dis='docker images'
alias dps='docker container ls --format "table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}"'
alias dpsa='docker container ls --format "table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}" -a'
alias gbv='git branch -v'
alias ll='ls -lGah'
alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias dcub='docker-compose up --build'
alias drmiu='docker rmi $(docker images | grep "^<none>" | awk "{print $3}")'
alias ave='aws-vault exec'
alias avde='aws-vault --debug exec'
alias avl='aws-vault login'
alias avu='unset AWS_VAULT'
alias avls='aws-vault ls'
alias tf='terraform'
alias abnt='setxkbmap -model abnt2 -layout br -variant ,abnt2'
alias path='tr ":" "\n" <<< "$PATH"'

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
. $HOME/.asdf/plugins/java/set-java-home.zsh

# zoxide
eval "$(zoxide init zsh)"

# oh-my-posh
eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/config.toml)"
