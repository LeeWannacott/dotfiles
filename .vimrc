set nocompatible           " vim defaults rather than vi ones. keep at top
set scl=yes " dont hide sign column
syntax on                  " enable syntax highlighting.
filetype on
filetype indent on
set autoindent             " use current indent for new lines.
set smartindent
filetype plugin indent on
set encoding=UTF-8
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
au BufEnter * set fo-=c fo-=r fo-=o " stop making comments on enter or new line
hi CursorLine   cterm=NONE ctermbg=black
hi TabLineFill ctermfg=DarkGray ctermbg=black cterm=NONE
hi ColorColumn ctermbg=black
hi CursorLineNR ctermfg=36  ctermbg=black
set number relativenumber
set viminfo+=/200
highlight CursorColumn ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 50})
augroup END

" Remappings
map <f2> :w! <cr>
nnoremap <f5> :vex <enter>
map <f4> :Texplore <enter>
noremap K <C-U>
noremap J <C-D>
vnoremap K <C-U>
vnoremap J <C-D>
noremap <C-K> {
noremap <C-J> }
vnoremap <C-K> {
vnoremap <C-J> }
noremap H ^
noremap L $
let mapleader = "\<tab>"
" tabs
nnoremap { gT
nnoremap } gt
nnoremap <unique> \ q
vnoremap <unique> \ q
nnoremap <unique> <Space> %
vnoremap <unique> <Space> %
noremap q b
noremap Q B
nnoremap B J
vnoremap B J
" window navigation
nnoremap <C-H> <C-W>h
nnoremap <C-D> <C-W>j
nnoremap <C-U> <C-W>k
nnoremap <C-L> <C-W>l
" noremap<leader>p "_dp
let @" = expand("%:p") " use reg ''0 to paste current directory
nnoremap <c-v> p
nnoremap b <c-V>
map <F7> :Files<CR>
map <F9> :UndotreeToggle<CR>
nnoremap Y y$
imap <c-v> <ESC>"+pA
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a
" not insert new line on enter if autocomplete window open for intellisense
inoremap <expr> <cr> ((pumvisible())?("\<C-y>"):("\<cr>")) " Enter autocomplete


set list
set listchars+=space:⋅
set listchars+=eol:↴
" PLUGINS vim-plug
let g:ale_javascript_quick_lint_js_experimental_typescript = 1
call plug#begin('~/.vim/plugged')
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
" Remap Ctrl+p and Ctrl+n to Ctrl+j and Ctrl+k in Telescope
noremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fc <cmd>Telescope current_buffer_fuzzy_find<cr>
" or                                , { 'branch': '0.1.x' }
Plug 'quick-lint/quick-lint-js', {'rtp': 'plugin/vim/quick-lint-js.vim'}
Plug 'dense-analysis/ale',{'tag':'v3.1.0'}
let ale_linters_explicit = 'true'
let g:ale_javascript_quick_lint_js_executable = '/usr/bin/quick-lint-js'
let g:ale_linters = { 'javascript': ['eslint','quick-lint-js'], 'typescript': ['quick-lint-js','tslint'] }
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
let g:coc_global_extensions = [ "coc-emmet", "coc-css", "coc-html", "coc-json", "coc-lua", "coc-vimlsp","coc-css","coc-clangd","coc-eslint","coc-go","coc-tsserver" ,"coc-godot"]

nmap gd <Plug>(coc-definition)
Plug 'airblade/vim-gitgutter'
" highlight GitGutterAdd  ctermfg=46 highlight GitGutterChange guifg=#4e4e4e highlight GitGutterDelete guifg=#af0000
Plug 'tpope/vim-fugitive' " Shorter git commands.
nnoremap <Leader>gb :if &filetype ==# 'fugitiveblame'<Bar>quit<Bar>else<Bar>G blame<Bar>endif<CR>
" Plug 'mattn/emmet-vim' " Faster boilerplate code.
" adds too much time startup.
" Plug 'easymotion/vim-easymotion' " Faster navigation.
Plug 'StanAngeloff/php.vim' " Support php
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'lukas-reineke/indent-blankline.nvim'

let g:indent_blankline_space_char_blankline = " "
let g:indent_blankline_show_current_context = v:true
let g:indent_blankline_show_current_context_start = v:true
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
Plug 'habamax/vim-godot'
" Go development.
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
let g:go_doc_keywordprg_enabled = 0 " disable go docs so can use K
" preview .MD files
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug '/home/lee/Desktop/nvim-dogecomments' " Development pathway.
" Plug '/home/lee/Desktop/nvim-snippets' " Development pathway.
" Plug 'leewannacott/nvim-dogecomments' " Install from my github repo
Plug 'matze/vim-move' " move lines of code with alt.

" Plug 'github/copilot.vim' " let microsoft steal all my code.
" imap <silent><script><expr> <A-Enter> copilot#Accept("\<CR>")

" let g:copilot_no_tab_map = v:true
Plug 'prettier/vim-prettier', { 'do': 'npm install' } " Formatting files
"let g:indentLine_char = '|'
Plug 'RRethy/vim-illuminate'
let g:Illuminate_delay = 5
Plug 'tpope/vim-surround'
Plug 'chrisbra/Colorizer'
Plug 'mg979/vim-visual-multi'
Plug '/home/lee/Desktop/nvim-matrix-indent'
" Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
" Plug '/home/lee/Desktop/solarizedtokyonight.nvim', { 'branch': 'main' }  " Development pathway.
Plug 'leewannacott/solarizedtokyonight.nvim', { 'branch': 'main' }  
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " need version 0.7 or higher; ubuntu LTS is currently 0.6.1
call plug#end()

let g:tokyonight_style = "night"
let g:tokyonight_italic_functions = 0
let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]
let g:tokyonight_transparent = 1
let g:tokyonight_colors = {
  \ 'hint': 'orange',
  \ 'error': '#ff0000',
\ }
colorscheme tokyonight
