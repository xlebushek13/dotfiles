#!/bin/bash

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";
echo 'Completed install Oh My Zsh' && cp .zshrc .zhistory .zsh_history ~/;
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
mkdir ~/.config/kitty/
cp kitty.conf ~/.config/kitty/
sudo pacman -S neovim kitty nodejs npm yarn python-black python-ruff mypy stylua zoxide
cd ~/.config/
git clone https://github.com/xlebushek13/neovim-config-new.git
mv ~/.config/neovim-config-new nvim
yay -S konsave;
