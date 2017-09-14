" Install vim-plug if we don't arlready have it
if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
  " Ensure all needed directories exist  (Thanks @kapadiamush)
  silent !mkdir -p ~/.local/share/nvim/plugged > /dev/null 2>&1
  " Download the actual plugin manager
  execute '!curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.local/share/nvim/plugged')

" Fancy statusline
Plug 'vim-airline/vim-airline'
Plug 'edkolev/tmuxline.vim'

" Syntax
Plug 'tpope/vim-git', { 'for': 'git' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

" Completion
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }

" Better JS Support
Plug 'pangloss/vim-javascript'

" code linting
Plug 'w0rp/ale'

" colorschemes
Plug 'morhetz/gruvbox'

" git edits in sidebar
Plug 'airblade/vim-gitgutter'

" file switching and viewer
Plug 'scrooloose/nerdtree'
Plug 'Shougo/unite.vim'

" support mru and unite
Plug 'Shougo/neomru.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }

" run unit tests
Plug 'janko-m/vim-test'

" make commenting easier
Plug 'tpope/vim-commentary'

" paste with indentation of context
Plug 'sickill/vim-pasta'

" respect editor config
Plug 'editorconfig/editorconfig-vim'

" tmux pane navigation
Plug 'christoomey/vim-tmux-navigator'

" vim surround
Plug 'tpope/vim-surround'

" vim.go
Plug 'fatih/vim-go'

Plug 'avakhov/vim-yaml'
" hardmode
Plug 'wikitopian/hardmode'

" close all buffers but this one
Plug 'vim-scripts/BufOnly.vim'

Plug 'roxma/nvim-completion-manager'

Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}
Plug 'roxma/ncm-rct-complete'

" All of your Plugs must be added before the following line
filetype plugin indent on    " required
call plug#end()