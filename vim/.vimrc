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
"set relativenumber              "relative line numbers also good
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
let mapleader=" "

" }}}-------------------------------------------------------------------------
"   Undo, Backup and Swap file locations                                  {{{
" ----------------------------------------------------------------------------
" Save your backups to a less annoying place than the current directory.
" If you have .vim-backup in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/backup or . if all else fails.
if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

" ================ Indentation ======================

filetype plugin indent on
set tabstop=2 shiftwidth=2 expandtab
set softtabstop=2

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

" shared clipboard
set clipboard=unnamed

" airline
set timeoutlen=200 ttimeoutlen=0
set laststatus=2
let g:airline#extensions#tabline#enabled = 1

" make sure powerline glyphs work
let g:airline_powerline_fonts = 1

let g:syntastic_javascript_checkers = ['eslint']

" go stuff
"
let g:syntastic_go_checkers = ['go', 'golint', 'govet', 'errcheck']
let g:go_list_type = "quickfix"

"transparent background (note has to go after local file,
"as that might set colors
"hi Normal ctermbg=none
hi LineNr ctermbg=none guibg=bg

"have <ENTER> add a new line staying in normal mode
nmap <CR> o<Esc>

" show paste mode
set showmode

" cycle through buffers
nnoremap <C-b> :bnext<CR>
nnoremap <C-n> :bprevious<CR>

"
" unite
let g:unite_data_directory = '~/.vim/.cache/unite'
let g:unite_source_rec_max_cache_files = 100000
let g:unite_source_history_yank_enable = 1
let g:unite_enable_start_insert = 5
let g:unite_split_rule = "botright"
let g:unite_force_overwrite_statusline = 0
let g:unite_winheight = 25

if executable('ag')
  " Use ag in unite grep source.
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
  \ '-i --vimgrep --hidden --ignore ' .
  \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
  let g:unite_source_grep_recursive_opt = ''
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
endif

" custom ignore pattern
call unite#custom#source('file_rec,file_rec/async',
      \ 'ignore_pattern', join([
        \ '\.bzr\/',
        \ '\.git\/',
        \ 'vendor\/',
        \ 'node_modules\/',
      \ ], '\|'))

" fuzzy matcher and sort everything
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

nnoremap <C-p> :FZF<cr>
nnoremap <leader>/ :Unite -no-split grep:.<cr>
nnoremap <leader>s :Unite -no-split -buffer-name=buffer buffer<cr>

" gundo
nnoremap <F5> :GundoToggle<CR>

" colorscheme
syntax enable
" solarized options
"let g:solarized_visibility = "high"
"let g:solarized_contrast = "high"
colorscheme gruvbox

source ~/.vim/syntax.vim
