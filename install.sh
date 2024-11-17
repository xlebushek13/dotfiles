#!/bin/bash

sudo pacman -S zsh;
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";
echo 'Completed install Oh My Zsh' && cp .zshrc .zhistory .zsh_history ~/;
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/catppuccin/zsh-syntax-highlighting.git
cp -v ./zsh-syntax-highlighting/catppuccin_mocha-zsh-syntax-highlighting.zsh ~/.oh-my-zsh/custom/plugins/
mkdir ~/.config/kitty/
cp kitty.conf ~/.config/kitty/
sudo pacman -S neovim kitty nodejs npm yarn python-black python-ruff mypy stylua zoxide fzf ripgrep python-isort tailwindcss-language-server lazygit yazi
mkdir ~/.config/yazi
cp ./theme.toml ~/.config/yazi
mkdir ~/.config/lazygit
cp ./config.yml ~/.config/lazygit/
cd ~/.config/
git clone https://github.com/xlebushek13/neovim-config-new.git
mv ~/.config/neovim-config-new nvim
yay -S konsave;
