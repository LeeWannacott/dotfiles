set nocompatible           " vim defaults rather than vi ones. keep at top
set background=dark " set background in terminal to #032730.
  

" sign column no hidie hide
set scl=yes
" hi Normal ctermbg=none
syntax on                  " enable syntax highlighting.
filetype on
filetype indent on
set autoindent             " use current indent for new lines.
set smartindent
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
set title
set showtabline=2
set mouse=a                " Mouse support
" set cursorline
au BufEnter * set fo-=c fo-=r fo-=o " stop making comments on enter or new line
hi CursorLine   cterm=NONE ctermbg=black
hi TabLineFill ctermfg=DarkGray ctermbg=black cterm=NONE
" hi LineNr ctermfg=DarkGray ctermbg=Black
" set colorcolumn=80
hi ColorColumn ctermbg=black
hi CursorLineNR ctermfg=36  ctermbg=black
set number relativenumber
set viminfo+=/200

" remappings
map <f2> :w! <cr>
nnoremap <f5> :vex <enter>
map <f4> :Texplore <enter>
noremap K {
noremap J }
noremap H ^
noremap L $

let mapleader = "\<tab>"

nnoremap { gT
nnoremap } gt

nnoremap <unique> \ q
vnoremap <unique> \ q
nnoremap <unique> <Space> %
vnoremap <unique> <Space> %

nnoremap q b
nnoremap Q B
nnoremap B J
vnoremap B J

vnoremap<leader>p "_dp
let @" = expand("%:p") " use reg ''0 to paste current directory
nnoremap <c-v> p
nnoremap b <c-V>

nnoremap Y y$
imap <c-v> <ESC>"+pA
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a
" not insert new line on enter if autocomplete window open for intellisense
inoremap <expr> <cr> ((pumvisible())?("\<C-y>"):("\<cr>")) " Enter autocomplete

highlight CursorColumn ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold
" PLUGINS vim-plug
call plug#begin('~/.vim/plugged')
set encoding=UTF-8

Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

map <F7> :Files<CR>
map <F9> :UndotreeToggle<CR>

Plug 'quick-lint/quick-lint-js', {'rtp': 'plugin/vim/quick-lint-js.vim'}
Plug 'dense-analysis/ale',{'tag':'v3.1.0'}
let ale_linters_explicit = 'true'
let g:ale_javascript_quick_lint_js_executable = '/usr/bin/quick-lint-js'
let g:ale_linters = { 'javascript': ['eslint'], 'typescript': ['tslint'] }
let g:ale_lint_delay = 0
let g:ale_lint_on_text_changed = 'always'
if exists('#ALEEvents')
  call ale#events#Init()
endif
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}
let g:ale_fix_on_save = 0

Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [ "coc-emmet", "coc-css", "coc-html", "coc-json", "coc-lua", "coc-vimlsp","coc-css","coc-clangd","coc-eslint","coc-go"]
nmap gd <Plug>(coc-definition)

Plug 'airblade/vim-gitgutter'
highlight GitGutterAdd  ctermfg=46
highlight GitGutterChange guifg=#4e4e4e
highlight GitGutterDelete guifg=#af0000

" Plug 'tpope/vim-fugitive' " Shorter git commands.
Plug 'mattn/emmet-vim' " Faster boilerplate code.

" adds too much time startup.
" Plug 'easymotion/vim-easymotion' " Faster navigation.

Plug 'StanAngeloff/php.vim' " Support php
Plug 'yggdroot/indentline' " Shows level of indentation with lines.
let g:indentLine_color_term = 239  " show indentation level

Plug 'mkitt/tabline.vim' " Tab numbering.
let g:tablineclosebutton=1

Plug 'dstein64/nvim-scrollview' " Show draggable scrollbar
Plug 'dstein64/vim-startuptime' " check startuptimes
highlight ScrollView ctermbg=Black guibg=LightCyan

" React - typescript development.
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'

" Go development.
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
let g:go_doc_keywordprg_enabled = 0 " disable go docs so can use K

" window navigation
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

" preview .MD files
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Comment out code using my own plugin
" Plug '/home/lee/Desktop/nvim-dogecomments' " Development pathway.
Plug '/home/lee/Desktop/nvim-snippets' " Development pathway.
Plug 'leewannacott/nvim-dogecomments' " Install from my github repo

" move lines of code with alt.
Plug 'matze/vim-move'
" let microsoft steal all my data.
" Plug 'github/copilot.vim'
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 50})
augroup END
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', { 'do': 'npm install' } " Formatting files
"let g:indentLine_char = '|'
Plug 'RRethy/vim-illuminate'
let g:Illuminate_delay = 0
Plug 'tpope/vim-surround'
Plug 'preservim/tagbar'
nmap <F8> :TagbarToggle<CR>
Plug 'chrisbra/Colorizer'

Plug 'mg979/vim-visual-multi'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

" lua <<EOF
" require('nvim-treesitter.configs').setup {
  " ensure_installed = "all",
  " hightlight = { enable = true },
  " indent = { enable = true }
" }
" EOF
  
" Example config in VimScript
let g:tokyonight_style = "night"
let g:tokyonight_italic_functions = 1
let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]

" Change the "hint" color to the "orange" color, and make the "error" color bright red
let g:tokyonight_colors = {
  \ 'hint': 'orange',
  \ 'error': '#ff0000'
\ }

" Load the colorscheme
colorscheme tokyonight

" colorscheme solarized " Solarized dark
