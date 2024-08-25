# ==> Some common variables
export HOSTNAME="$(hostname)"

# ==> Default programs
export EDITOR="nvim"
export TERMINAL="foot"

# ==> XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share:$HOME/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share"
export XDG_CACHE_HOME="$HOME/.cache"

# ==> PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin/antibody:$PATH"
export PATH="$HOME/.local/share/cargo/bin:$PATH"
# https://wiki.archlinux.org/title/Blender#HIP_on_AMD_open_source_drivers
[ -d "/opt/rocm/bin" ] && export PATH="/opt/rocm/bin:$PATH"

# ==> $HOME cleanup
export LESSHISTFILE="-"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export RUSTUP_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/rustup"
export WINEPREFIX="${XDG_DATA_HOME:-$HOME/.local/share}/wineprefixes/default"
export GHCUP_USE_XDG_DIRS=true

# ==> Privacy
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# ==> Nvidia wayland stuff
[ "$HOSTNAME" = "bbaoportable" ] && export LIBVA_DRIVER_NAME=nvidia
[ "$HOSTNAME" = "bbaoportable" ] && export GBM_BACKEND=nvidia-drm
[ "$HOSTNAME" = "bbaoportable" ] && export __GLX_VENDOR_LIBRARY_NAME=nvidia
[ "$HOSTNAME" = "bbaoportable" ] && export WLR_NO_HARDWARE_CURSORS=1

# ==> Wayland
[ "$XDG_SESSION_TYPE" = "wayland" ] && export MOZ_ENABLE_WAYLAND=1
[ "$XDG_SESSION_TYPE" = "wayland" ] && export WLR_RENDERER=vulkan
[ "$XDG_SESSION_TYPE" = "wayland" ] && export SDL_VIDEODRIVER=wayland
[ "$XDG_SESSION_TYPE" = "wayland" ] && export _JAVA_AWT_WM_NONREPARENTING=1
echo $DESKTOP_SESSION | grep sway > /dev/null && export XDG_CURRENT_DESKTOP=sway

# ==> GNOME Keyring
export SSH_AUTH_SOCK=/run/user/$(id -u)/gcr/ssh

# ==> Qt
[ "$XDG_CURRENT_DESKTOP" != "KDE" ] && export QT_QPA_PLATFORMTHEME=qt5ct

# wlroots debug
#export WLR_SCENE_DEBUG_DAMAGE=rerender
#export WLR_SCENE_DEBUG_DAMAGE=highlight
#export WLR_XWAYLAND=~/git-repos/xserver/build/hw/xwayland/Xwayland
