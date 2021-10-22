set nocompatible           " vim defaults rather than vi ones. keep at top
set background=dark " set background in terminal to #032730.
colorscheme solarized " Solarized dark

syntax on                  " enable syntax highlighting.
filetype on
filetype indent on
set autoindent             " use current indent for new lines.
filetype plugin indent on   "

set spelllang=en_nz
set clipboard+=unnamedplus " enable paste from system: sudo need xsel and xclip
set backspace=2            " make the backspace behave as most applications
set display=lastline       " show as much of the line as will fit.
set wildmenu               " better tab completion in the commandline.
set wildmode=list:longest  " list all matches and complete to the longest match.
set showcmd                " Show (partial) command in bottom-right.
set smarttab               " Backspace removes 'shiftwidth' worth of spaces
set noswapfile
set undodir=~/.vim/undodir
set undofile
set wrap                   " Wrap long lines.
set laststatus=2           " Always show the statusline.
set ruler                  " Show the ruler in the statusline.
set textwidth=80           " Wrap at n characters.  set nrformats-=octal
" Remove octal support from 'nrformats'.

set tabstop=2              " Size of a Tab character.
set shiftwidth=2          " Use same value as 'tabstop'.
set expandtab
set softtabstop=2
set showcmd                " Display current key input in status menu.
set incsearch
set hlsearch               " Highlight all words with *.
set smartcase ignorecase
set number
set history=10000
set noerrorbells
set title
set showtabline=2
set mouse=a                " Mouse support
" set cursorline
au BufEnter * set fo-=c fo-=r fo-=o " stop making comments on enter or new line
hi CursorLine   cterm=NONE ctermbg=black
hi TabLineFill ctermfg=black ctermbg=black
hi LineNr ctermfg=DarkGray ctermbg=Black
set colorcolumn=80
hi ColorColumn ctermbg=black
hi CursorLineNR ctermfg=36  ctermbg=black
set number relativenumber
" :augroup numbertoggle
" :  autocmd!
" :  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
" :  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
" :augroup END
" Save searches
set viminfo+=/200

" REMAPPINGS
map <F2> :w! <CR>
nnoremap <F8> :Vex <ENTER>
map <F4> :Explore <ENTER>
noremap K {
noremap J }
noremap H ^
noremap L $

let mapleader = "\<Tab>"

nnoremap <unique> \ q
vnoremap <unique> \ q
nnoremap <unique> <Space> %
vnoremap <unique> <Space> %

noremap q b
noremap Q B
noremap B J

vnoremap<leader>p "_dp
let @" = expand("%:p") " use reg ''0 to paste current directory
nnoremap <c-v> p
nnoremap b <c-V>

nnoremap Y y$ " Yank to end of line.
imap <c-v> <ESC>"+pA
:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>a
" not insert new line on enter if autocomplete window open for intellisense
inoremap <expr> <cr> ((pumvisible())?("\<C-y>"):("\<cr>")) " Enter autocomplete

" PLUGINS vim-plug
call plug#begin('~/.vim/plugged')
Plug 'ryanoasis/vim-devicons'
Plug 'her/synicons.vim'
set encoding=UTF-8


Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
map <F8> :Files<CR>
Plug 'dense-analysis/ale',{'tag':'v3.1.0'}
Plug 'quick-lint/quick-lint-js', {'rtp': 'plugin/vim/quick-lint-js.vim'}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}
let g:ale_fix_on_save = 1


Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [ "coc-emmet", "coc-css", "coc-html", "coc-json", "coc-lua", "coc-vimlsp","coc-css","coc-clangd","coc-eslint"]
nmap gd <Plug>(coc-definition)


" Plug 'airblade/vim-gitgutter'
" highlight GitGutterAdd  ctermfg=46
" highlight GitGutterChange guifg=#4e4e4e
" highlight GitGutterDelete guifg=#af0000

Plug 'tpope/vim-fugitive' " Shorter git commands.
Plug 'mattn/emmet-vim' " Faster boilerplate code.
Plug 'easymotion/vim-easymotion' " Faster navigation.
Plug 'StanAngeloff/php.vim' " Support php
Plug 'yggdroot/indentline' " Shows level of indentation with lines.
let g:indentLine_color_term = 239  " show indentaion level

Plug 'justinmk/vim-sneak' " More complicated f. Use s and two keypress to find.
Plug 'mkitt/tabline.vim' " Tab numbering.
Plug 'dstein64/nvim-scrollview' " Show draggable scrollbar
Plug 'dstein64/vim-startuptime' " check startuptimes
highlight ScrollView ctermbg=Black guibg=LightCyan

" React - typescript development.
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'

" preview .MD files
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Comment out code using my own plugin
" Plug '/home/lee/Desktop/nvim-dogecomments' " Development pathway.

Plug '/home/lee/Desktop/nvim-snippets' " Development pathway.
Plug 'leewannacott/nvim-dogecomments' " Install from my github repo

" move lines of code with alt.
Plug 'matze/vim-move'

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 50})
augroup END

" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', { 'do': 'npm install' } " Formatting files
"let g:indentLine_char = '|'
Plug 'RRethy/vim-illuminate'
let g:Illuminate_delay = 10

call plug#end()
