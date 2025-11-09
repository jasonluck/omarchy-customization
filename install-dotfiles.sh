#!/bin/bash

ORIGINAL_DIR=$(pwd)
REPO_URL="git@github.com:jasonluck/dotfiles.git"
REPO_DIR="dotfiles"

is_stow_installed() {
  pacman -Qi "stow" &> /dev/null
}

if ! is_stow_installed; then
  echo "Install stow first"
  exit 1
fi

cd ~

# Check if the repository already exists
if [ -d "$REPO_DIR" ]; then
  echo "Repository '$REPO_DIR' already exists. Skipping clone"
else
  git clone "$REPO_URL" "$REPO_DIR"
fi

# Check if the clone was successful
if [ $? -eq 0 ]; then
  echo "removing old configs"
  rm -rf ~/.config/nvim ~/.config/starship.toml ~/.local/share/nvim/ ~/.cache/nvim/ ~/.config/ghostty/config

  cd "$REPO_DIR"
  stow zshrc
  #stow ghostty
  stow tmux
  stow nvim
  stow starship
else
  echo "Failed to clone the repository."
  exit 1
fi

cd "$ORIGINAL_DIR"

