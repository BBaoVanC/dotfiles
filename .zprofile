#!/bin/sh

# ==> Default programs
export EDITOR="nvim"
export BROWSER="firefox-nightly"
export TERMINAL="st"

# ==> XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# ==> PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin/supermenu:$PATH"
export PATH="$HOME/.dwm/dwmblocks/blocks:$PATH"
export PATH="$HOME/.dwm/dwmblocks/daemons:$PATH"

# ==> $HOME cleanup
export LESSHISTFILE="-"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export WINEPREFIX="${XDG_DATA_HOME:-$HOME/.local/share}/wineprefixes/default"
export TASKDATA="$XDG_DATA_HOME"/task
export TASKRC="$XDG_CONFIG_HOME"/task/taskrc

# ==> Qt5
export QT_QPA_PLATFORMTHEME="qt5ct"

# ssh-agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 24h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [ -z "$SSH_AUTH_SOCK" ]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" > /dev/null
fi

# ==> Fix Ctrl-O keybind on macOS
[ "$(uname -s)" = "Darwin" ] && stty discard undef > /dev/null 2>&1
