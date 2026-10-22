# Plugins
plugins=(
  asdf
  vi-mode
  git
  docker
  docker-compose
  node
  npm
  gradle
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
source $ZDOTDIR/aliasrc

# Functions
source $ZDOTDIR/functions.zsh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# asdf
. $HOME/.asdf/plugins/java/set-java-home.zsh

# zoxide
eval "$(zoxide init zsh)"

# starship
eval "$(starship init zsh)"
function set_win_title(){
    echo -ne "\033]0; $(basename "$PWD") \007"
}
precmd_functions+=(set_win_title)

# include hidden files
_comp_options+=(globdots)

# Edit line in vim with ctrl-e
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
