# ==> Default programs
export EDITOR="nvim"
export TERMINAL="kitty"

# ==> XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# ==> PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin/antibody:$PATH"
export PATH="$HOME/.local/share/cargo/bin:$PATH"

# ==> $HOME cleanup
export LESSHISTFILE="-"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export RUSTUP_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/rustup"
export WINEPREFIX="${XDG_DATA_HOME:-$HOME/.local/share}/wineprefixes/default"

# ==> Wayland
export MOZ_ENABLE_WAYLAND=1

# ==> KWallet SSH
export SSH_ASKPASS="/usr/bin/ksshaskpass"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
