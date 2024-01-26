" let g:vimtex_view_method = 'mupdf'
" let g:vimtex_view_general_viewer = 'mupdf'
let g:vimtex_quickfix_mode = 0
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_latexmk = {
    \ 'aux_dir' : '',
    \ 'out_dir' : '',
    \ 'callback' : 1,
    \ 'continuous' : 0,
    \ 'executable' : 'latexmk',
    \ 'hooks' : [],
    \ 'options' : [
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}
let g:vimtex_syntax_conceal_disable = 1
let g:vimtex_syntax_conceal = {
    \ 'accents': 0,
    \ 'ligatures': 0,
    \ 'cites': 0,
    \ 'fancy': 0,
    \ 'spacing': 0,
    \ 'greek': 0,
    \ 'math_bounds': 0,
    \ 'math_delimiters': 0,
    \ 'math_fracs': 0,
    \ 'math_super_sub': 0,
    \ 'math_symbols': 0,
    \ 'sections': 0,
    \ 'styles': 0,
    \}
