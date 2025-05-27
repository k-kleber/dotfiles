export SHELL=$(which zsh)
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

if command -v nvim >/dev/null 2>&1; then
  export EDITOR=nvim
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ -e "/home/linuxbrew/.linuxbrew/bin/brew" ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

if [[ -e "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -e "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# If apt install fails, use this fallback:
if [ ! -e "$HOME/.fzf" ]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install --all
fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
# zinit snippet OMZP::colored-man-pages
zinit snippet OMZP::colorize
zinit snippet OMZP::docker
zinit snippet OMZP::docker-compose
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings
#bindkey -e
#bindkey '^p' history-search-backward
#bindkey '^n' history-search-forward
#bindkey '^[w' kill-region
# Fix Delete key
bindkey "^[[3~" delete-char
# Fix Home and End keys
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

bindkey '^ ' autosuggest-accept

# History
HISTSIZE=50000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'
alias vim='nvim'
alias c='clear'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

alias l='eza -1 --icons --git'
alias tree='eza --tree --icons'
alias ls='eza -lah --git --icons'
alias ll='eza -l --git --icons'
alias la='eza -a --git --icons'
alias lt='eza --tree --level=2 --icons'

# ROS Development Aliases (added by ros-complete-setup.sh)
alias ros-dev='distrobox enter ros-ubuntu'
alias ros-code='distrobox enter ros-ubuntu -- code'
alias ros-status='distrobox list | grep ros-ubuntu'
alias ros-enter='distrobox enter ros-ubuntu'
alias ros-stop='distrobox stop ros-ubuntu'
alias ros-start='distrobox start ros-ubuntu'

if [ -e "/opt/ros/noetic/setup.zsh" ]; then
  source /opt/ros/noetic/setup.zsh
fi

if [ -e "/opt/ros/melodic/setup.zsh" ]; then
  source /opt/ros/melodic/setup.zsh
fi

if [ -e "$HOME/Qt/6.6.3" ]; then
  export QT_HOME=$HOME/Qt/6.6.3/gcc_64
  export PATH=$QT_HOME/bin:$PATH
  export CMAKE_PREFIX_PATH=$QT_HOME
fi

# ArduPilot Development Aliases (added by ardupilot-complete-setup.sh)
alias ap-dev='distrobox enter ardupilot-ubuntu'
alias ap-sitl='distrobox enter ardupilot-ubuntu -- bash -c "cd ~/ardupilot && ./waf copter && ./build/sitl/bin/arducopter --model quad"'
alias ap-status='distrobox list | grep ardupilot-ubuntu'
alias ap-enter='distrobox enter ardupilot-ubuntu'
alias ap-stop='distrobox stop ardupilot-ubuntu'
alias ap-start='distrobox start ardupilot-ubuntu'

if command -v podman >/dev/null 2>&1; then
  export DOCKER_HOST=unix:///run/user/$(id -u)/podman/podman.sock
fi

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

if [ -f "/usr/share/nvm/init-nvm.sh" ]; then
  source /usr/share/nvm/init-nvm.sh
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
