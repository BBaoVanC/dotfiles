#!/bin/zsh

echo "[*] Setting up dotfiles repository"
echo "    cd ~"
cd ~
echo "    git init"
git init
echo "    git remote add origin https://git.bbaovanc.com/bbaovanc/dotfiles.git"
git remote add origin https://git.bbaovanc.com/bbaovanc/dotfiles.git
echo "    git pull origin master"
git pull origin master
echo "    git branch --set-upstream-to=origin/master master"
git branch --set-upstream-to=origin/master master

echo "[+] Downloading vim-plug to \`${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim\`..."
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "[+] Downloading powerlevel10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

echo "[+] Downloading zsh plugins..."
cd ~/.zsh_plugins
./clone.zsh

echo "[+] Setup complete!"
echo "    Now, run \`:PlugInstall\` in Neovim."
