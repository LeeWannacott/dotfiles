set nocompatible           " vim defaults rather than vi ones. keep at top
filetype plugin indent on  " enable filetype-specific settings
syntax on                  " enable syntax highlighting.
set backspace=2            " make the backspace behave as most applications.
set autoindent             " use current indent for new lines. What do you think that there is a time.
set display=lastline       " show as much of the line as will fit.
set wildmenu               " better tab completion in the commandline.
set wildmode=list:longest  " list all matches and complete to the longest match.
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
set relativenumber 
set history=1000
set title
hi LineNr ctermfg=DarkCyan ctermbg=Black

:nnoremap l w 
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
:nnoremap H j
 
:nnoremap ; $
:nnoremap K }
:nnoremap I {
:nnoremap ' e
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
 
:nnoremap U <C-r>
:nnoremap A I
:nnoremap M A 
