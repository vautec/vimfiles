filetype off                  " required

let vundle_autoinstall = 0

let bundle_user_dir = expand('~/vimfiles/bundle')
let vundle_user_dir = bundle_user_dir . '/Vundle.vim'
let vundle_readme = vundle_user_dir . '/README.md'

if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    execute 'silent !mkdir ' . vundle_user_dir 
    execute 'silent !git clone https://github.com/VundleVim/Vundle.vim.git ' . vundle_user_dir
    let vundle_autoinstall = 1
endif

" set the runtime path to include Vundle and initialize
"set rtp+=
let &runtimepath.=','. vundle_user_dir
call vundle#begin(bundle_user_dir)
"call vundle#begin()

 " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ternjs/tern_for_vim'
Plugin 'ervandew/supertab'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'morhetz/gruvbox'
Plugin 'Shougo/unite.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'aaronbieber/vim-vault'

Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'

Plugin 'jeetsukumaran/vim-gazetteer'

Plugin 'SirVer/ultisnips'                                  " Track the engine.
Plugin 'honza/vim-snippets'                                " Snippets are separated from the engine. Add this if you want them:

Plugin 'gcmt/wildfire.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'terryma/vim-multiple-cursors'

Plugin 'tacahiroy/ctrlp-funky'
Plugin 'aaronbieber/vim-quicktask'


"Plugin 'scrooloose/syntastic'
"Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required

if vundle_autoinstall
    echo "Installing bundles..."
    echo ""
    :BundleInstall
endif

filetype plugin indent on    " required
