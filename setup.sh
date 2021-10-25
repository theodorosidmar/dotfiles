#!/bin/bash

base=(
  zsh
  ohmyzsh
  git
)

system=(
  i3
  rofi
  polybar
  picom
  fonts
  betterlockscreen
  wallpapers
  xinitrc
  xbindkeys
  xresources
)

code=(
  vim
  alacritty
)

apps=( "${base[@]}" "${system[@]}" "${code[@]}" )

echo "Stowing apps for user: ${whoami}"
echo ""

for app in ${apps[@]}; do
  stow -vRt ${HOME} $app
done

git submodule init
git submodule update

echo ""
echo "Stowed some apps."

