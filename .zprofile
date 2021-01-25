#!/bin/sh

# ==> Default programs
export EDITOR="nvim"

# ==> XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# ==> PATH
export PATH="$HOME/.local/bin:$PATH"

# ==> $HOME cleanup
export LESSHISTFILE="-"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"

# ==> pam-gnupg
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

# ==> Fix Ctrl-O keybind on macOS
[ "$(uname -s)" = "Darwin" ] && stty discard undef > /dev/null 2>&1
