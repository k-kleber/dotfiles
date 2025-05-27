#!/usr/bin/env bash

# Install dependencies (Debian/Ubuntu example)
sudo apt update
sudo apt install -y zsh git curl fonts-powerline

sudo apt remove -y rustc
if ! command -v rustup &>/dev/null; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi
rustup self update
rustup update
rustc --version

# Install zoxide
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >>~/.profile
export PATH="$HOME/.local/bin:$PATH"

# Install eza
if ! command -v eza &>/dev/null; then
  export PATH="$HOME/.cargo/bin:$PATH"
  cargo install eza
  echo 'export PATH="$HOME/.cargo/bin:$PATH"' >>~/.profile
fi

if ! command -v fzf &>/dev/null; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install --all
fi

# Install Powerlevel10k font (optional, for best prompt appearance)
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

# Change default shell to zsh
chsh -s "$(which zsh)"

# Source .zshrc
exec zsh
