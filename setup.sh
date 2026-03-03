#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# Files/directories that symlink directly into ~
HOME_LINKS=(
  .vimrc
  .zshrc
  .zsh
  .hammerspoon
  .warp
)

# Items inside .config that symlink into ~/.config/<item>
CONFIG_LINKS=(
  goto
  helix
  iterm2
  neofetch
  starship.toml
)

link() {
  local src="$1" dest="$2"
  if [ -L "$dest" ]; then
    echo "  updating: $dest -> $src"
    ln -sfn "$src" "$dest"
  elif [ -e "$dest" ]; then
    echo "  backing up: $dest -> ${dest}.bak"
    mv "$dest" "${dest}.bak"
    ln -sfn "$src" "$dest"
  else
    echo "  linking: $dest -> $src"
    ln -sfn "$src" "$dest"
  fi
}

echo "==> Linking dotfiles from $DOTFILES_DIR"

# Home directory links
for item in "${HOME_LINKS[@]}"; do
  link "$DOTFILES_DIR/$item" "$HOME/$item"
done

# Ensure ~/.config exists
mkdir -p "$HOME/.config"

# Config directory links
for item in "${CONFIG_LINKS[@]}"; do
  link "$DOTFILES_DIR/.config/$item" "$HOME/.config/$item"
done

# Tmux (lives at ~/.config/tmux)
link "$DOTFILES_DIR/tmux" "$HOME/.config/tmux"

echo "==> Done!"
