set nocompatible           " vim defaults rather than vi ones. keep at top
filetype plugin indent on  " enable filetype-specific settings
syntax on                  " enable syntax highlighting.
set backspace=2            " make the backspace behave as most applications.
set autoindent             " use current indent for new lines. 
set smartindent
set display=lastline       " show as much of the line as will fit.
set wildmenu               " better tab completion in the commandline.
set wildmode=list:longest  " list all matches and complete to the longest match.
set showcmd                " Show (partial) command in bottom-right.
set smarttab               " Backspace removes 'shiftwidth' worth of spaces.
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
hi LineNr ctermfg=DarkCyan ctermbg=Black
set colorcolumn=80
highlight ColorColumn ctermbg=0 
 
:nnoremap i k
:nnoremap k j
:nnoremap j b

:nnoremap J h
:vnoremap J h
:nnoremap n o
:nnoremap N O 
:nnoremap o n 
:nnoremap O N 
 
:nnoremap m a
:nnoremap a i
:nnoremap h 0
:nnoremap H J
:nnoremap b %
:nnoremap ; $
 
:nnoremap K }
:nnoremap I {
:nnoremap l w
:vnoremap K }
:vnoremap I {
:nnoremap L l
:vnoremap L l
 
:vnoremap j B
:vnoremap l E 
:vnoremap k j
:vnoremap h 0
:vnoremap ; $
:vnoremap i k 
:vnoremap K } 
 
:nnoremap U <C-r>
:nnoremap A I
:nnoremap M A 

:nnoremap <F2> :Explore <ENTER> 




