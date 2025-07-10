#!/bin/bash
set -e
sudo apt-get install libevent-dev ncurses-dev build-essential bison pkg-config
wget https://github.com/tmux/tmux/releases/download/3.5a/tmux-3.5a.tar.gz
tar -xzf tmux-3.5a.tar.gz
cd tmux-3.5a
./configure && make
sudo make install
cd ..
rm -rf tmux-3.5a
rm tmux-3.5a.tar.gz
