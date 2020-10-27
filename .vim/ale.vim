let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0
let g:ale_sign_error = '●'

let g:ale_linter_aliases = {
\   'svelte': ['javascript']
\}
let g:ale_linters = {
\   'svelte': ['eslint']
\}
let g:ale_fixers = {
\   'svelte': ['eslint']
\}

let g:ale_disable_lsp = 1
let g:ale_fix_on_save = 1

autocmd FileType go :ALEDisable
