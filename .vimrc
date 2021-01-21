set nocompatible           " vim defaults rather than vi ones. keep at top
syntax on                  " enable syntax highlighting.
set autoindent             " use current indent for new lines. 
filetype plugin indent on
set clipboard+=unnamedplus
set backspace=2            " make the backspace behave as most applications
set display=lastline       " show as much of the line as will fit.
set wildmenu               " better tab completion in the commandline.
set wildmode=list:longest  " list all matches and complete to the longest match.
set showcmd                " Show (partial) command in bottom-right.
set smarttab               " Backspace removes 'shiftwidth' worth of spaces
set smartcase
set noswapfile
set undodir=~/.vim/undodir
set undofile
set wrap                   " Wrap long lines.
set laststatus=2           " Always show the statusline.
set ruler                  " Show the ruler in the statusline.
set textwidth=80           " Wrap at n characters.
set nrformats-=octal       " Remove octal support from 'nrformats'.
set tabstop=4              " Size of a Tab character.
set shiftwidth=4          " Use same value as 'tabstop'.
set expandtab
set softtabstop=4
set showcmd                " Display current key input in status menu.
set incsearch
set hlsearch               " Highlight all words with *.
set number
set relativenumber 
set history=1000
set noerrorbells
set title
set showtabline=2
hi TabLineFill ctermfg=black ctermbg=DarkGreen
hi LineNr ctermfg=36 ctermbg=Black
set colorcolumn=80
highlight ColorColumn ctermbg=0 
" REMAPPINGS
nnoremap <F2> :Vex <ENTER> 
nnoremap <F4> :NERDTreeToggle <ENTER> 
noremap K {
noremap J }
noremap H ^
noremap L $

noremap b %
noremap q b
noremap Q B
noremap <F9> q
noremap <F10> Q
noremap B J

nmap >> <Nop>
nmap << <Nop>
vmap >> <Nop>
vmap << <Nop>

nnoremap <Tab>   >>
nnoremap <S-Tab> <<
vnoremap <Tab>   >><Esc>gv
vnoremap <S-Tab> <<<Esc>gv

nnoremap Y y$
imap <c-v> <ESC>"+pA

" PLUGINS vim-plug
call plug#begin('~/.vim/plugged')
Plug 'ryanoasis/vim-devicons'
Plug 'her/synicons.vim'
set encoding=UTF-8
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
map <F8> :Files<CR>
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver','coc-python']
Plug 'scrooloose/nerdcommenter'
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
Plug 'airblade/vim-gitgutter'
highlight GitGutterAdd  ctermfg=46 
highlight GitGutterChange guifg=#4e4e4e
highlight GitGutterDelete guifg=#af0000
"highlight! link SignColumn LineNr
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'StanAngeloff/php.vim'
Plug 'yggdroot/indentline'
Plug 'gregsexton/matchtag'
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
let g:indentLine_color_term = 239
"let g:indentLine_char = '|'
call plug#end()
