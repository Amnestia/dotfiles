let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_structs = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 1
let g:go_auto_type_info = 1
let g:go_decls_mode = 'fzf'

" coc gopls command
autocmd FileType go nmap gtj :CocCommand go.tags.add json<cr>
autocmd FileType go nmap gtdb :CocCommand go.tags.add db<cr>
autocmd FileType go nmap gtms :CocCommand go.tags.add mapstructure<cr>
autocmd FileType go nmap gtx :CocCommand go.tags.clear<cr>
autocmd FileType go nmap gfs :GoFillStruct<cr>
autocmd FileType go nmap gdd :GoDeclsDir<cr>
autocmd FileType go nmap gru :GoRun %<cr>

autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd Filetype go nmap <Leader>e :'<,'>GoFreevars

"" Golang interface function name copy cleanup
autocmd Filetype go nnoremap <Leader>gir 6dwA<Esc>x
