# ~/.zshrc
# Ubuntu-like interactive shell behavior for zsh

# Stop here for non-interactive shells
[[ $- != *i* ]] && return

# History behavior similar to Ubuntu bashrc defaults
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000
SAVEHIST=2000
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# Enable completion
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' rehash true

# Enable colors
autoload -U colors && colors

# Load dircolors if available (same idea as Ubuntu bashrc)
if command -v dircolors >/dev/null 2>&1; then
  eval "$(dircolors -b)"
fi

# Core aliases from Ubuntu-style defaults
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Colored prompt similar to Ubuntu:
# user@host:cwd$
setopt PROMPT_SUBST
if [[ $EUID -eq 0 ]]; then
  PROMPT='%F{red}%n@%m%f:%F{blue}%~%f# '
else
  PROMPT='%F{green}%n@%m%f:%F{blue}%~%f$ '
fi

# Optional: chroot name in prompt if present (Ubuntu feature)
if [[ -r /etc/debian_chroot ]]; then
  debian_chroot="$(< /etc/debian_chroot)"
  PROMPT="(${debian_chroot}) ${PROMPT}"
fi

# Optional: command-not-found integration if installed
if command -v command-not-found >/dev/null 2>&1; then
  command_not_found_handler() {
    command-not-found "$1"
    return 127
  }
fi