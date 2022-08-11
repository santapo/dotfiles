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

elif [[ "$OSTYPE" == "Linus"* ]]; then
    mkdir -p $HOME/.local/bin/
    echo -e "${GREEN}Installing NeoVim...${NC}"
    wget https://github.com/neovim/neovim/releases/download/v0.7.2/nvim-linux64.tar.gz
    tar xfz nvim-linux64.tar.gz
    rm nvim-linux64.tar.gz
    mv nvim-linux64/bin/nvim $HOME/.local/bin/

    echo -e "${GREEN}Installing zsh-shell...${NC}"
    wget https://sourceforge.net/projects/zsh/files/zsh/5.9/zsh-5.9.tar.xz
    tar xf zsh-5.9.tar.xz
    cd zsh-5.9
    ./configure --prefix="$HOME/.local" \
        CPPFLAGS="-I$HOME/.local/include" \
        LDFLAGS="-L$HOME/.local/lib"
    make -j && make install
    # Append this to .bash_profile
    # export PATH=$HOME/local/bin:$PATH
    # export SHELL=`which zsh`
    # [ -f "$SHELL" ] && exec "$SHELL" -l
fi


echo -e "${GREEN}Installing oh-my-zsh...${NC}"
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install NeoVim Plugins
# :PlugInstall
# :CocInstall coc-tsserver coc-css coc-eslint coc-emmet coc-pyright coc-prettier
# pip install black

curl -sfLS install-node.vercel.app | bash -s -- --prefix=$HOME/.local --verbose


# 

