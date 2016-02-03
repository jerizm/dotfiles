" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" vim plug
if filereadable(expand("~/.vim/plug.vim"))
  source ~/.vim/plug.vim
endif

" source ~/.vimrc.before if it exists.
if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

" ================ General Config ====================

set encoding=utf-8
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set autoread                    "Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
let mapleader=","

" }}}-------------------------------------------------------------------------
"   Undo, Backup and Swap file locations                                  {{{
" ----------------------------------------------------------------------------

" Don't leave .swp files everywhere. Put them in a central place
if !isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
endif

if !isdirectory(expand('~').'/.vim/swap')
  silent !mkdir ~/.vim/swap > /dev/null 2>&1
endif

if !isdirectory(expand('~').'/.vim/undo')
  silent !mkdir ~/.vim/undo > /dev/null 2>&1
endif

set directory=~/.vim/swap//
set backupdir=~/.vim/backups//
if exists('+undodir')
    set undodir=/.vim/undo
    set undofile
endif

" ================ Indentation ======================

filetype plugin indent on
set tabstop=2 shiftwidth=2 expandtab

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

"
" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" ================ custom settings ===========================

" make sure powerline glyphs work

let g:airline_powerline_fonts = 1

" use silver searcher for ctrlp
if executable("ag")
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden --depth 8 -g ""'
endif

let g:syntastic_javascript_checkers = ['eslint']

"transparent background (note has to go after local file,
"as that might set colors
"hi Normal ctermbg=none
hi LineNr ctermbg=none guibg=bg

"NERDTree
"show hidden files
let NERDTreeShowHidden=1

"toggle display of nerdtree: http://stackoverflow.com/a/10417725/1011470
nmap ,n :NERDTreeFind<CR>
nmap ,m :NERDTreeToggle<CR>

"have <ENTER> add a new line staying in normal mode
nmap <CR> o<Esc>

" insert spaces in normal mode
nmap <space> i<space><esc>

" function yank function cut
nmap  fy    jvaBVy
nmap  fc    jvaBVd

" show paste mode
set showmode

" stamp over words
noremap S "_diwP

" colorscheme
let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme solarized
