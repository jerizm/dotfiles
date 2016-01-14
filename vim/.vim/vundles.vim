filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" let Vundle manage Vundle, required
Plugin 'tpope/vim-sensible'
Plugin 'pangloss/vim-javascript'
" cool color scheme, but I don't want to use it now Plugin 'goatslacker/mango.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-commentary'
Plugin 'sickill/vim-pasta'
Plugin 'ternjs/tern_for_vim'
Plugin 'editorconfig/editorconfig-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
