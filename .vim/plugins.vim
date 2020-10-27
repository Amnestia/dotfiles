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
Plug 'scrooloose/nerdcommenter'
Plug 'kien/rainbow_parentheses.vim'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'othree/yajs.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'wakatime/vim-wakatime'
Plug 'editorconfig/editorconfig-vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'

Plug 'dense-analysis/ale'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'jparise/vim-graphql'

Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

Plug 'fatih/vim-go',{'do': ':GoInstallBinaries'}
call plug#end()
