#!/bin/bash
set -e  # Exit on error

# Display section headers for better readability
echo_section() {
  echo
  echo "========== $1 =========="
}

# Install required packages using pacman
echo_section "Installing packages"
sudo pacman -S --needed zsh neovim kitty nodejs npm yarn python-black python-ruff mypy \
  stylua zoxide fzf ripgrep python-isort tailwindcss-language-server lazygit yazi

# Install and configure Oh My Zsh
echo_section "Setting up Oh My Zsh"
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  echo 'Completed installing Oh My Zsh'
else
  echo "Oh My Zsh already installed, skipping..."
fi

# Copy shell configuration files
echo_section "Copying shell configuration files"
cp -v .zshrc .zhistory .zsh_history ~/

# Install Zsh plugins
echo_section "Installing Zsh plugins"
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}

# Install zsh-autosuggestions plugin
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
fi

# Install zsh-syntax-highlighting plugin
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
fi

# Install powerlevel10k theme
if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
fi

# Install Catppuccin theme for zsh-syntax-highlighting
echo_section "Installing Catppuccin theme"
if [ ! -d "./zsh-syntax-highlighting" ]; then
  git clone https://github.com/catppuccin/zsh-syntax-highlighting.git
fi
cp -v ./zsh-syntax-highlighting/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh $ZSH_CUSTOM/plugins/

# Configure Kitty terminal
echo_section "Configuring Kitty terminal"
mkdir -p ~/.config/kitty/
cp -v kitty.conf ~/.config/kitty/

# Configure Yazi file manager
echo_section "Configuring Yazi file manager"
mkdir -p ~/.config/yazi
cp -v ./theme.toml ~/.config/yazi

# Configure LazyGit
echo_section "Configuring LazyGit"
mkdir -p ~/.config/lazygit
cp -v ./config.yml ~/.config/lazygit/

# Install Neovim configuration
echo_section "Setting up Neovim configuration"
if [ ! -d "$HOME/.config/nvim" ]; then
  cd ~/.config/
  git clone https://github.com/xlebushek13/neovim-config-new.git
  mv ~/.config/neovim-config-new nvim
else
  echo "Neovim configuration already exists, skipping..."
fi

# Install Konsave using yay (AUR helper)
echo_section "Installing Konsave from AUR"
yay -S konsave

echo_section "Installation complete!"
echo "Please restart your shell or run 'zsh' to apply changes."
