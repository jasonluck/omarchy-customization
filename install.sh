#!/bin/sh

# Install applications
./apps/zsh.sh
./apps/tmux.sh
./apps/stow.sh
./apps/golang.sh
./apps/input-leap.sh # Input Leap is currently not working with Hyperland

# Install dotfiles
./install-dotfiles.sh

# Configure our shell
./set-shell.sh
