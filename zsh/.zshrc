export ZSH="$HOME/.oh-my-zsh"

# Theme
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vi_mode status ram time)
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins
plugins=(
  vi-mode
  git
  dnf
  docker
  node
  npm
  gradle
  aws
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
alias drmiu='docker rmi $(docker images | grep "^<none>" | awk "{print $3}")'
alias ave='aws-vault exec'
alias avde='aws-vault --debug exec'
alias avl='aws-vault login'

# Variables
export WORKSPACE=$HOME/workspace
export DOTFILES=$HOME/dotfiles

# nvm (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
. $HOME/.asdf/plugins/java/set-java-home.zsh

# tfenv
export PATH="$HOME/.tfenv/bin:$PATH"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
