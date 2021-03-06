#!/bin/sh

# ==> Default programs
export EDITOR="nvim"
export BROWSER="firefox-nightly"
export TERMINAL="kitty"

# ==> XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# ==> PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin/supermenu:$PATH"
export PATH="$HOME/.dwm/dwmblocks/blocks:$PATH"
export PATH="$HOME/.dwm/dwmblocks/tools:$PATH"

# ==> Use nvim for man pager
export MANPAGER='nvim +Man!'

# ==> $HOME cleanup
export LESSHISTFILE="-"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export WINEPREFIX="${XDG_DATA_HOME:-$HOME/.local/share}/wineprefixes/default"

# ==> Qt5
export QT_QPA_PLATFORMTHEME="qt5ct"

# ==> ssh-agent
if [ -z "$DISABLE_SSH_AGENT" ]; then
    if ! pgrep -u "$USER" ssh-agent > /dev/null; then
        ssh-agent -t 24h > "$XDG_RUNTIME_DIR/ssh-agent.env"
    fi
    if [ -z "$SSH_AUTH_SOCK" ]; then
        source "$XDG_RUNTIME_DIR/ssh-agent.env" > /dev/null
    fi
fi

# ==> https://wiki.archlinux.org/index.php/Dwm#Fixing_misbehaving_Java_applications
export _JAVA_AWT_WM_NONREPARENTING=1
