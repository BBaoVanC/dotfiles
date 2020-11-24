# bbaovanc's dotfiles setup

## Table of Contents

- [bbaovanc's dotfiles setup](#bbaovancs-dotfiles-setup)
  - [Table of Contents](#table-of-contents)
  - [Requirements (not including submodules)](#requirements-not-including-submodules)
    - [Before installation](#before-installation)
    - [Installed at runtime](#installed-at-runtime)
    - [Included configs](#included-configs)
  - [Installation](#installation)
  - [Images](#images)

## Requirements (not including submodules)

OS: macOS or GNU/Linux

### Before installation

- git
- zsh
- neovim (cannot be regular vim)
- fzf (optional)

### Installed at runtime

**Note: If you have manually installed any of these, you should uninstall them**

- Zinit (with plugins)
  - powerlevel10k (with configs to work with Nord theme)
  - fast-syntax-highlighting

### Included configs

- zsh
- powerlevel10k
- dunst
- fontconfig
- neovim
- ranger
- goblocks (dwm statusbar)
- picom (requires symlink `/etc/xdg/picom.conf` -> `~/.config/picom.conf`)
- disable Xorg mouse acceleration (requires symlink `/etc/X11/xorg.conf.d/50-mouse-acceleration.conf` -> `~/.config/50-mouse-acceleration.conf`)

## Installation

My dotfiles are in a very early stage, and will change very often. I don't really recommend using them until they are more stable.

## Images

![My st fork](https://media.bbaovanc.com/dotfiles-example/st1.png)
![Neovim](https://media.bbaovanc.com/dotfiles-example/nvim.png)
