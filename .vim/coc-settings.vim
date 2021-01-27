autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

let g:coc_global_extensions=[
\ 'coc-json',
\ 'coc-go',
\ 'coc-tailwindcss',
\ 'coc-snippets',
\ 'coc-omni',
\ 'coc-marketplace',
\ 'coc-gitignore',
\ 'coc-git',
\ 'coc-yaml',
\ 'coc-vimlsp',
\ 'coc-tsserver',
\ 'coc-svelte',
\ 'coc-sql',
\ 'coc-rls',
\ 'coc-python',
\ 'coc-markdownlint',
\ 'coc-import-cost',
\ 'coc-docker',
\ 'coc-flutter'
\ ]
