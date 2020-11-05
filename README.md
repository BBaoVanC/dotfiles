# bbaovanc's dotfiles setup

## Table of Contents

- [bbaovanc's dotfiles setup](#bbaovancs-dotfiles-setup)
  - [Table of Contents](#table-of-contents)
  - [Requirements](#requirements)
  - [Installation](#installation)
  - [Images](#images)

## Requirements

OS: macOS or GNU/Linux

- zsh
- git
- neovim (cannot be regular vim)

## Installation

```shell
$ zsh <(curl -fsSL https://git.bbaovanc.com/bbaovanc/dotfiles-util/raw/branch/master/dotfiles-setup.zsh)
```

Near the end of the script, it will ask you to choose from the powerlevel10k styles I included.
Please see the [images](#images) section.

You can switch between a few different zsh styles I included by running the script named `p10k-switch-style.zsh` located in `$HOME`.

```shell
$ ~/p10k-switch-style.zsh
```

## Images

![macOS Terminal with Blur](https://media.bbaovanc.com/dotfiles-example/macosterm1.png)
