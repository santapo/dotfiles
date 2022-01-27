" This line makes pacman-installed global Arch Linux vim packages work.
set nu
set expandtab ts=4 sw=4 ai
set clipboard=unnamedplus
set autoindent
set si "smart indent

" Turn of backup
set nobackup
set nowb
set noswapfile
set backupdir=~/tmp,/tmp
set backupcopy=yes
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set directory=/tmp

source /usr/share/nvim/archlinux.vim
source /home/santapo/.config/nvim/vim-plug/plugins.vim
