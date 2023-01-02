#!/bin/bash

# install nvim
sudo apt-get update
sudo apt-get install neovim

# install vim plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# point nvim vimrc location to HOME/vimrc and add CocSettings.
mkdir -p ~/.config/nvim && \
sudo cp .config/nvim/init.vim ~/.config/nvim/init.vim & \
sudo cp .config/nvim/coc-settings.json ~/.config/nvim/coc-settings.json

# install nvm && node.
sudo apt-get install build-essential checkinstall libssl-dev
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
nvm install node 18
nvm use node 18
sudo apt install npm

# install quick-lint-js.
curl https://c.quick-lint-js.com/quick-lint-js-release.key | sudo apt-key add -
printf '\n# From: https://quick-lint-js.com/install/neovim/debian/\ndeb [arch=amd64] https://c.quick-lint-js.com/debian experimental main\n' | sudo tee /etc/apt/sources.list.d/quick-lint-js.list
sudo apt-get update
sudo apt-get install quick-lint-js quick-lint-js-vim

# install font manager; default sucks on pop os.
sudo apt install font-manager

# install the best programming font known to people-kind.
sudo mkdir -p /usr/share/fonts/truetype/IBM/ && \
sudo cp IBMPlexMono-Regular.ttf /usr/share/fonts/truetype/IBM/IBMPlexMono-Regular.ttf

# install zsh && oh-my-zsh.
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo cp .zshrc ~/.zshrc
sudo cp .bashrc ~/.bashrc
sudo cp .profile ~/.profile

# zsh syntax highlighting && autosuggestions.
gh repo clone zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
gh repo clone zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
# use zsh as default shell.
chsh -s $(which zsh)
# source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
