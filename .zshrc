#!/bin/zsh
#
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# ========== Environment ==========
source ~/.zprofile
HISTFILE=~/.zsh_history
SAVEHIST=500
source ~/.zshrc_nosync


# ========== Miscellaneous aliases ==========
alias ls="exa --group-directories-first --color=auto --icons"
alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias mntdrv="sudo mount -o uid=$(whoami)"
alias dragon="dragon-drag-and-drop -a -x"
alias rscp="rsync -atzvP"
alias scpng="scanimage --progress --format=png --output-file"
alias ccat="highlight --out-format=xterm256"
alias rmorphans="sudo pacman -Rns $(pacman -Qdtq | xargs)"


# ========== Vi mode ========== https://gist.github.com/LukeSmithxyz/e62f26e55ea8b0ed41a65912fbebbe52
bindkey -v
# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[2 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[6 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[6 q"
}
zle -N zle-line-init
echo -ne '\e[6 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[6 q' ;} # Use beam shape cursor for each new prompt


# ========== Enable powerlevel10k ==========
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# ========== Enable zsh-syntax-highlighting ==========
source ~/.zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
