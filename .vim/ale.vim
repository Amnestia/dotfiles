let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0
let g:ale_sign_error = 'E'

let g:ale_linter_aliases = {
\   'svelte': ['javascript']
\}
let g:ale_linters = {
\	'css': 			['prettier'],
\	'html':			['prettier'],
\   'svelte': 		['eslint'],
\   'java':			['javac'],
\   'markdown':		['mdl']
\}
let g:ale_fixers = {
\	'css': 		['prettier'],
\	'html': 	['prettier'],
\   'svelte': 	['eslint'],
\   '*':		['remove_trailing_lines', 'trim_whitespace']
\}

let g:ale_disable_lsp = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_enter = 1

"autocmd FileType go :ALEDisable
let g:ale_go_golangci_lint_package=1
