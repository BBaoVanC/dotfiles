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

# ==> VA-API
export LIBVA_DRIVER_NAME=nvidia

# ==> Wayland
export MOZ_ENABLE_WAYLAND=1
