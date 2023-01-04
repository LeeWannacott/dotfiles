#!/bin/bash

# install nvim
sudo apt-get update
sudo apt upgrade
sudo apt-get install -y neovim

# point nvim vimrc location to HOME/vimrc and add CocSettings.
sudo cp .vimrc ~/.vimrc
mkdir -p ~/.config/nvim && \
sudo cp .config/nvim/init.vim ~/.config/nvim/init.vim & \
sudo cp .config/nvim/CocConfig.json ~/.config/nvim/coc-settings.json

# install vim plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# install gnome tweaks for rebinding caps lock
sudo apt update
sudo apt upgrade
sudo apt-add-repository -y universe
sudo apt install -y gnome-tweaks

# install the GitHub CLI
type -p curl >/dev/null || sudo apt install curl -y
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y

# install zsh && oh-my-zsh.
sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo cp .zshrc ~/.zshrc
sudo cp .bashrc ~/.bashrc
sudo cp .profile ~/.profile

# install nvm && node.
sudo apt-get install -y build-essential checkinstall libssl-dev
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
nvm install 18
nvm use 18
sudo apt install -y npm

# install quick-lint-js.
curl https://c.quick-lint-js.com/quick-lint-js-release.key | sudo apt-key add -
printf '\n# From: https://quick-lint-js.com/install/neovim/debian/\ndeb [arch=amd64] https://c.quick-lint-js.com/debian experimental main\n' | sudo tee /etc/apt/sources.list.d/quick-lint-js.list
sudo apt-get update
sudo apt-get install -y quick-lint-js quick-lint-js-vim

# install font manager; default sucks on pop os.
sudo apt install -y font-manager

# install the best programming font known to people-kind.
sudo mkdir -p /usr/share/fonts/truetype/IBM/ && \
sudo cp IBMPlexMono-Regular.ttf /usr/share/fonts/truetype/IBM/IBMPlexMono-Regular.ttf

# zsh syntax highlighting && autosuggestions.
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/zsh-autosuggestions

# use zsh as default shell.
sudo chsh -s $(which zsh)

# login to github
git config --global user.name "LeeWannacott"
git config --global user.email "WannacottL@gmail.com"
gh auth login
