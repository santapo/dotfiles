" This line makes pacman-installed global Arch Linux vim packages work.
set nu
set expandtab ts=4 sw=4 ai
set clipboard=unnamedplus
set autoindent
set si "smart indent
set mouse=a
set encoding=UTF-8
set list
set listchars=trail:·

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

"NERDTree
map <C-b> :NERDTreeToggle<CR>
map <C-i> :NERDTreeFind<CR>
let g:NERDTreePatternMatchHighlightFullName = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'node_modules']
let g:NERDTreeShowBookmarks=1
"Theme
syntax enable
set background=dark
highlight Normal ctermbg=None
colorscheme github_dark_default
set termguicolors
"set cursorline
hi CursorLineNr term=bold ctermfg=Yellow gui=bold guifg=Yellow
