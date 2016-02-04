" Install vim-plug if we don't arlready have it
if empty(glob("~/.vim/autoload/plug.vim"))
    " Ensure all needed directories exist  (Thanks @kapadiamush)
    silent !mkdir -p ~/.vim/plugged > /dev/null 2>&1
    silent !mkdir -p ~/.vim/autoload > /dev/null 2>&1
    " Download the actual plugin manager
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

" Syntax
Plug 'tpope/vim-git', { 'for': 'git' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

" Completion
Plug 'mattn/emmet-vim', { 'for': 'html' }

" Better JS Support
Plug 'pangloss/vim-javascript'

" code linting
Plug 'scrooloose/syntastic'

" colorschemes
Plug 'chriskempson/base16-vim'
Plug 'altercation/vim-colors-solarized'

" git edits in sidebar
Plug 'airblade/vim-gitgutter'

" file switching and viewer
Plug 'scrooloose/nerdtree'
Plug 'Shougo/unite.vim'

" support mru and unite
Plug 'Shougo/neomru.vim'
Plug 'Shougo/vimproc.vim'

" code-completion
Plug 'Valloric/YouCompleteMe'

" class outline viewer
Plug 'majutsushi/tagbar'

" Fancy statusline
Plug 'bling/vim-airline'

" Fugitive: Git from within Vim
Plug 'tpope/vim-fugitive'

" make commenting easier
Plug 'tpope/vim-commentary'

" paste with indentation of context
Plug 'sickill/vim-pasta'

" tern base JS support
Plug 'ternjs/tern_for_vim'

" respect editor config
Plug 'editorconfig/editorconfig-vim'

" tmux pane navigation
Plug 'christoomey/vim-tmux-navigator'

" All of your Plugs must be added before the following line
filetype plugin indent on    " required
call plug#end()
