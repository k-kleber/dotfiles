#!/usr/bin/env bash

# Install dependencies (Debian/Ubuntu example)
sudo apt update
sudo apt install -y zsh git curl fonts-powerline

# Install zoxide
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

# Install eza
if ! command -v eza &> /dev/null; then
  sudo apt install -y cargo
  cargo install eza
  echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.profile
  export PATH="$HOME/.cargo/bin:$PATH"
fi

# Install Powerlevel10k font (optional, for best prompt appearance)
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

# Change default shell to zsh
chsh -s "$(which zsh)"

# Source .zshrc
exec zsh