" Plugins
call plug#begin()
    " Appearance
    Plug 'vim-airline/vim-airline'
    Plug 'ryanoasis/vim-devicons'

    " Utilities
    Plug 'sheerun/vim-polyglot'
    Plug 'jiangmiao/auto-pairs'
    Plug 'ap/vim-css-color'
    Plug 'preservim/nerdtree'

    " Completion / linters / formatters
    Plug 'neoclide/coc.nvim',  {'branch': 'release'}
    " Plug 'davidhalter/jedi-vim'
    Plug 'plasticboy/vim-markdown'

    " Git
    Plug 'airblade/vim-gitgutter'

    " Color schemes
    Plug 'morhetz/gruvbox'
    Plug 'elvessousa/sobrio'
call plug#end()

" This line makes pacman-installed global Arch Linux vim packages work
set number
set title
set completeopt=noinsert,menuone,noselect
set wildmenu
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
set notermguicolors

filetype plugin indent on
syntax on

" Color support
set t_Co=256
" True color if available
let term_program=$TERM_PROGRAM

" Check for conflicts with Apple Terminal app
if term_program !=? 'Apple_Terminal'
    set termguicolors
else
    if $TERM !=? 'xterm-256color'
        set termguicolors
    endif
endif

" Italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" NodeJS
" let g:coc_node_path = '${HOME}/.local/bin/node'

" let g:jedi#goto_command = "<leader>d"
" let g:jedi#goto_assignments_command = "<leader>g"
" let g:jedi#goto_stubs_command = "<leader>s"
" let g:jedi#goto_definitions_command = ""
" let g:jedi#documentation_command = "K"
" let g:jedi#usages_command = "<leader>n"
" let g:jedi#completions_command = "<C-Space>"
" let g:jedi#rename_command = "<leader>r"
" let g:jedi#environment_path = "/opt/homebrew/bin/python3"

" let g:airline_theme='sobrio'
" let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1

let NERDTreeShowHidden=1
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Normal mode remappings
nnoremap <C-q> :q!<CR>
nnoremap <F4> :bd<CR>
nnoremap <F5> :NERDTreeToggle<CR>
nnoremap <F6> :sp<CR>:terminal<CR>

" Tabs
nnoremap <S-Tab> gT
nnoremap <Tab> gt
nnoremap <silent> <S-t> :tabnew<CR>


command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

""" Customize colors
"func! s:my_colors_setup() abort
"    " this is an example
"    hi Pmenu guibg=#d7e5dc gui=NONE
"    hi PmenuSel guibg=#b7c7b7 gui=NONE
"    hi PmenuSbar guibg=#bcbcbc
"    hi PmenuThumb guibg=#585858
"endfunc
"
"augroup colorscheme_coc_setup | au!
"    au ColorScheme * call s:my_colors_setup()
"augroup END
hi Pmenu ctermbg=red ctermfg=white
