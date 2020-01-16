#!/bin/bash

base=(
  zsh
  ohmyzsh
  git
)

system=(
  i3
  polybar
  fonts
)

code=(
  vim
  alacritty
)

apps=( "${base[@]}" "${system[@]}" "${code[@]}" )

echo "Stowing apps for user: ${whoami}"
echo ""

git submodule init
git submodule update

for app in ${apps[@]}; do
  stow -vRt ${HOME} $app
done

echo ""
echo "Stowed some apps."

