
set nocompatible           " Vim defaults rather than vi ones. Keep at top.
filetype plugin indent on  " Enable filetype-specific settings.
syntax on                  " Enable syntax highlighting.
set backspace=2            " Make the backspace behave as most applications.
set autoindent             " Use current indent for new lines.
set display=lastline       " Show as much of the line as will fit.
set wildmenu               " Better tab completion in the commandline.
set wildmode=list:longest  " List all matches and complete to the longest match.
set showcmd                " Show (partial) command in bottom-right.
set smarttab               " Backspace removes 'shiftwidth' worth of spaces.
set wrap                   " Wrap long lines.
set laststatus=2           " Always show the statusline.
set ruler                  " Show the ruler in the statusline.
set textwidth=80           " Wrap at n characters.
set nrformats-=octal       " Remove octal support from 'nrformats'.
set tabstop=4              " Size of a Tab character
set shiftwidth=0           " Use same value as 'tabstop'.
set softtabstop=-1         " Use same value as 'shiftwidth'.
set showcmd                " Display current key input in status menu.
set hlsearch               " Highlight all words with *.
set number
hi LineNr term=bold ctermfg=DarkMagenta
set relativenumber 

:nnoremap l W
:nnoremap L E 

:nnoremap i k
:nnoremap k j
:nnoremap j b
:nnoremap J B 

:nnoremap n o
:nnoremap N O 
:nnoremap o n 
 
:nnoremap O N 
:nnoremap a i
 
:nnoremap ; $
:nnoremap h 0 
:nnoremap K }
:nnoremap I {
 
:vnoremap j B
:vnoremap i k
:vnoremap l e 
:vnoremap k j
:vnoremap h 0
:vnoremap ; $

:nnoremap U <C-r>

 
