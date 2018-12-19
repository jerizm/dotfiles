" Install vim-plug if we don't arlready have it
if empty(glob("~/.vim/autoload/plug.vim"))
  " Ensure all needed directories exist  (Thanks @kapadiamush)
  silent !mkdir -p ~/.vim/plugged > /dev/null 2>&1
  silent !mkdir -p ~/.vim/autoload > /dev/null 2>&1
  " Download the actual plugin manager
  execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif


function! BuildYCM(info)
  if has("unix")
    let s:uname = system("uname -s")
    if s:uname == "Darwin"
      ./install.py --tern-completer
    endif
  elseif
    ./install.py
  endif
endfunction
call plug#begin('~/.vim/plugged')

" Fancy statusline
Plug 'vim-airline/vim-airline'

" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-git', { 'for': 'git' }

" Completion
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }

" Better JS Support
Plug 'pangloss/vim-javascript'

" code linting
Plug 'w0rp/ale'

" colorschemes
" Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'

" git edits in sidebar
Plug 'airblade/vim-gitgutter'

" file switching and viewer
Plug 'Shougo/unite.vim'

" support mru and unite
Plug 'Shougo/neomru.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" make commenting easier
Plug 'tpope/vim-commentary'

" paste with indentation of context
Plug 'sickill/vim-pasta'

" tern base JS support
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

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
Plug 'cespare/vim-toml'
" All of your Plugs must be added before the following line
filetype plugin indent on    " required
call plug#end()
