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
source $ZDOTDIR/aliasrc

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

# include hidden files
_comp_options+=(globdots)

# Edit line in vim with ctrl-e
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
