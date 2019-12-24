#!/bin/bash

base=(
  zsh
  git
)

system=(
  fonts
)

code=(
  vim
)

apps=( "${base[@]}" "${system[@]}" "${code[@]}" )

echo "Stowing apps for user: ${whoami}"
echo ""

for app in ${apps[@]}; do
  stow -vRt ${HOME} $app
done

echo ""
echo "Stowed some apps."

