# Dotfiles Management with GNU Stow

This repository uses [GNU Stow](https://www.gnu.org/software/stow/) to manage and symlink dotfiles.

## Prerequisites

- Install GNU Stow:  
  `sudo apt install stow` (Debian/Ubuntu)  
  or  
  `brew install stow` (macOS)

## Directory Structure

Organize your dotfiles in subdirectories named after the target application or purpose.  
Example:
```
/home/kevin/.dotfiles/
├── bash/
│   └── .bashrc
├── nvim/
│   └── .config/nvim/init.vim
├── git/
│   └── .gitconfig
```

## Usage

From the root of your dotfiles repo:

```sh
stow .
```

This will symlink the files into your home directory (by default).

## Unstowing

To remove symlinks created by Stow:

```sh
stow -D bash
```

## Tips

- Only run `stow` from the root of your dotfiles repo.
- To target a different directory, use `-t` (e.g., `stow -t ~/.config nvim`).
- Keep each application's files in its own folder for clarity.

## Resources

- [GNU Stow Manual](https://www.gnu.org/software/stow/manual/stow.html)

- [Explainer](https://www.youtube.com/watch?v=y6XCebnB9gs)