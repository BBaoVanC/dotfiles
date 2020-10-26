# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ "$(hostname)" == "bbaobook" ]]; then
    export PATH="/usr/local/sbin:$PATH"
fi

if [[ "$(uname -s)" == "Darwin" ]]; then  # macOS
    alias ls="ls -G"
elif [[ "$(uname -s)" == "Linux" ]]; then  # Linux
    alias ls="ls --color"
fi


source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source ~/.profile
HISTFILE=~/.zsh_history
SAVEHIST=500

source ~/.zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
