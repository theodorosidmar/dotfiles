# Toggle between Alacritty themes
alacritty-toggle-theme() {
  local config="$HOME/.config/alacritty/alacritty.toml"

  if grep -q '^  "~/.config/alacritty/catppuccin-latte.toml"' "$config"; then
    # Currently using latte, switch to frappe
    sed -i 's|^  "~/.config/alacritty/catppuccin-latte.toml"|  # "~/.config/alacritty/catppuccin-latte.toml"|' "$config"
    sed -i 's|^  # "~/.config/alacritty/catppuccin-frappe.toml"|  "~/.config/alacritty/catppuccin-frappe.toml"|' "$config"
    echo "Switched to catppuccin-frappe theme"
  else
    # Currently using frappe, switch to latte
    sed -i 's|^  "~/.config/alacritty/catppuccin-frappe.toml"|  # "~/.config/alacritty/catppuccin-frappe.toml"|' "$config"
    sed -i 's|^  # "~/.config/alacritty/catppuccin-latte.toml"|  "~/.config/alacritty/catppuccin-latte.toml"|' "$config"
    echo "Switched to catppuccin-latte theme"
  fi
}
