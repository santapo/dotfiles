#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

OSTYPE=`uname -s`

echo -e "${GREEN}Installing for $OSTYPE...${NC}"

# Overwrite dotfiles
cp ./.zshrc $HOME/.zshrc
cp -r ./nvim $HOME/.config/nvim



# Install NeoVim
if [[ "$OSTYPE" == "Darwin"* ]]; then
    echo -e "${GREEN}Installing NeoVim...${NC}"
    brew install neovim

    echo -e "${GREEN}Installing zsh-shell...${NC}"
    brew install zsh
    # change shell
    chsh -s $(which zsh)
fi


echo -e "${GREEN}Installing oh-my-zsh...${NC}"
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# 

