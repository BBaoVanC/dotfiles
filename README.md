# bbaovanc's dotfiles setup

## Table of Contents

- [bbaovanc's dotfiles setup](#bbaovancs-dotfiles-setup)
  - [Table of Contents](#table-of-contents)
  - [Requirements](#requirements)
  - [Installation](#installation)
  - [Styles](#styles)
    - [Lean (`.p10k.zsh.style.lean`)](#lean-p10kzshstylelean)
    - [Oneline (`.p10k.zsh.style.oneline`)](#oneline-p10kzshstyleoneline)
    - [Twoline Concise (`.p10k.zsh.style.twoline_concise`)](#twoline-concise-p10kzshstyletwoline_concise)

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
Please see the [images](#styles) of each style.

You can switch between a few different zsh styles I included by running the script named `p10k-switch-style.zsh` located in `$HOME`.

```shell
$ ~/p10k-switch-style.zsh
```

## Styles

### Lean (`.p10k.zsh.style.lean`)

![Lean image](https://media.bbaovanc.com/dotfiles-example/lean.png)

### Oneline (`.p10k.zsh.style.oneline`)

![Oneline image](https://media.bbaovanc.com/dotfiles-example/oneline.png)

### Twoline Concise (`.p10k.zsh.style.twoline_concise`)

![Twoline image](https://media.bbaovanc.com/dotfiles-example/twoline_concise.png)
