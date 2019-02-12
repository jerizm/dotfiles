" Install vim-plug if we don't arlready have it
if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
  " Ensure all needed directories exist  (Thanks @kapadiamush)
  silent !mkdir -p ~/.local/share/nvim/plugged > /dev/null 2>&1
  silent !mkdir -p ~/.local/share/nvim/autoload > /dev/null 2>&1
  " Download the actual plugin manager
  execute '!curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.local/share/nvim/plugged')

" Fancy statusline
" Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
" Plug 'edkolev/tmuxline.vim'

" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-git', { 'for': 'git' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

" Better JS Support
Plug 'pangloss/vim-javascript'

" code linting
Plug 'w0rp/ale'

" prettier
Plug 'prettier/vim-prettier', { 'do': 'npm install' }

" colorschemes
Plug 'joshdick/onedark.vim'
" Plug 'morhetz/gruvbox'

" git edits in sidebar
Plug 'airblade/vim-gitgutter'

" file switching and viewer
Plug 'Shougo/unite.vim'

" support mru and unite
Plug 'Shougo/neomru.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" fzy picker
Plug 'srstevenson/vim-picker'

" make commenting easier
Plug 'tpope/vim-commentary'

" respect editor config
Plug 'editorconfig/editorconfig-vim'

" tmux pane navigation
Plug 'christoomey/vim-tmux-navigator'

" vim surround
Plug 'tpope/vim-surround'

" vim.go
Plug 'fatih/vim-go'

Plug 'avakhov/vim-yaml'

" hardtime
Plug 'takac/vim-hardtime'

" close all buffers but this one
Plug 'vim-scripts/BufOnly.vim'

" completion
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'

Plug 'leafgarland/typescript-vim'
Plug 'cespare/vim-toml'

" All of your Plugs must be added before the following line
filetype plugin indent on    " required
call plug#end()
