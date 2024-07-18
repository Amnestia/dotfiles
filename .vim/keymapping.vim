let mapleader=','

"" Split
noremap <Leader>h :split<CR>
noremap <Leader>v :vsplit<CR>

"" Unhighlight search result
nnoremap <Esc><Esc> :nohlsearch<Bar>:echo<CR>

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

"" Windows navigations
nnoremap <C-n> :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-u> :UndotreeToggle<CR>

"" Visual block
nnoremap <C-V> <C-v>

"" Swap two words ex. b = a -> a = b
nnoremap cx yiwwwviwpbbbviwp

"" Error navigations
nnoremap <leader>[ :lprev<CR>
nnoremap <leader>] :lnext<CR>
