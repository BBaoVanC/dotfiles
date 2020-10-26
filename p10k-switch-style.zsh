#!/bin/zsh

cd ~

currlink=$(readlink .p10k.zsh)

if [[ -z "$currlink" ]]; then
    currstyle="unset"
fi

echo "Please pick a style (currently $currstyle):"

select style in .p10k.zsh.style.*; do
    break
done

if [[ -z "$style" ]]; then
    echo "ERR: Invalid style"
    exit 1
fi

ln -sf "$style" .p10k.zsh

echo "Done. Reload zsh using \`exec zsh\`"
