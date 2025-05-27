#!/bin/bash

sudo apt update
sudo apt install -y stow
rm "$HOME/.zshrc"
stow .

chmod +x setup-zsh-ubuntu.sh
./setup-zsh-ubuntu.sh
chmod +x install-nvim.sh
./install-nvim.sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
