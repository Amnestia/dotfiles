set nocompatible
filetype off

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plug-bundles')
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'https://github.com/rakr/vim-one.git'
Plug 'https://github.com/tomasr/molokai.git'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'kien/rainbow_parentheses.vim'
Plug 'othree/yajs.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'yggdroot/indentline'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'
Plug 'https://github.com/jasonccox/vim-wayland-clipboard.git'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'

Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'jparise/vim-graphql'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'


Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()
