#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

echo "----------------------------------------------------"
echo "  Installing Latest Neovim on Ubuntu 18.04        "
echo "----------------------------------------------------"

# 1. Update package lists
echo "Updating package lists..."
sudo apt update -y

# 2. Install essential build tools and dependencies
echo "Installing essential build tools and dependencies..."
sudo apt install -y \
  build-essential \
  cmake \
  unzip \
  gettext \
  libtool \
  libtool-bin \
  automake \
  pkg-config \
  ninja-build \
  curl

# 3. Remove any existing Neovim installations (optional, but recommended for a clean install)
echo "Removing any existing Neovim installations..."
sudo apt remove -y neovim || true # Use || true to prevent script from exiting if neovim is not installed
sudo rm -rf /usr/local/bin/nvim
sudo rm -rf /usr/local/share/nvim

# 4. Clone the Neovim repository
echo "Cloning the Neovim repository..."
NVIM_DIR="$HOME/nvim-build"
if [ -d "$NVIM_DIR" ]; then
  echo "Removing existing nvim-build directory..."
  rm -rf "$NVIM_DIR"
fi
git clone https://github.com/neovim/neovim.git "$NVIM_DIR"

# 5. Build and install Neovim
echo "Building and installing Neovim..."
cd "$NVIM_DIR"
make CMAKE_BUILD_TYPE=Release
sudo make install || sudo make install/strip

# 6. Clean up
echo "Cleaning up build directory..."
cd "$HOME"
rm -rf "$NVIM_DIR"

# 7. Verify installation
echo "Verifying Neovim installation..."
if command -v nvim &>/dev/null; then
  echo "Neovim installed successfully!"
  echo "Version: $(nvim --version | head -n 1)"
  echo "You can now run 'nvim' to start Neovim."
else
  echo "Neovim installation failed. Please check the output for errors."
  exit 1
fi

echo "----------------------------------------------------"
echo "  Installation Complete!                          "
echo "----------------------------------------------------"
