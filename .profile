# ==> Some common variables
export HOSTNAME="$(hostname)"

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

# ==> Nvidia wayland stuff
[ "$HOSTNAME" = "bbaoportable" ] && export GBM_BACKEND=nvidia-drm
[ "$HOSTNAME" = "bbaoportable" ] && export WLR_NO_HARDWARE_CURSORS=1

# ==> Wayland
[ "$XDG_SESSION_TYPE" = "wayland" ] && export MOZ_ENABLE_WAYLAND=1
[ "$XDG_SESSION_TYPE" = "wayland" ] && export WLR_RENDERER=vulkan

# ==> GNOME Keyring
export SSH_AUTH_SOCK=/run/user/$(id -u)/gcr/ssh

# ==> Qt
#[ "$XDG_SESSION_TYPE" = "wayland" ] && export QT_QPA_PLATFORM=wayland
[ "$XDG_CURRENT_DESKTOP" != "KDE" ] && export QT_QPA_PLATFORMTHEME=qt5ct
