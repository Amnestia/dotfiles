set ff=unix
set encoding=utf-8
set autoindent smartindent smarttab
set number relativenumber
set ignorecase
set smartcase
set splitbelow
set splitright
set cursorline
set incsearch
set hlsearch
set ttyfast
set tabstop=4
set shiftwidth=4
set updatetime=1024
set undolevels=512
set history=512
set scrolloff=512


set directory^=$HOME/.vim/swap//
try
	set undodir=$HOME/.vim/undo
	set undofile
catch
endtry


filetype plugin on
filetype plugin indent on
if !exists("g:syntax on")
	syntax enable
endif

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['white',   'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:airline#extensions#tabline#enabled = 1
let g:nerdtree_tabs_open_on_console_startup = 1
let g:jsx_ext_required = 0
let g:mkdp_auto_close = 0
let g:mkdp_refresh_slow = 1
