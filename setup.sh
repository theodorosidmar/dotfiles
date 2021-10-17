#!/bin/bash

base=(
  zsh
  ohmyzsh
  git
)

system=(
  i3
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

xbindkeys --poll-rc

for app in ${apps[@]}; do
  stow -vRt ${HOME} $app
done

echo ""
echo "Stowed some apps."

