export ZSH="/home/theodorosidmar/.oh-my-zsh"

# Theme
POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status history ram time)
ZSH_THEME="powerlevel9k/powerlevel9k"

# Plugins
plugins=(
  git
  dnf
  docker
  node
  npm
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Source
source $ZSH/oh-my-zsh.sh

# Aliases
alias dis='docker images'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias gbv='git branch -v'
alias ll='ls -lGah'
alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias dcub='docker-compose up --build'
alias dm='docker-machine'

# Variables
export WORKSPACE=$HOME/workspace

# nvm (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
