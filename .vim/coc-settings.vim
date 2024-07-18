autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

let g:coc_global_extensions=[
\ 'coc-json',
\ 'coc-snippets',
\ 'coc-omni',
\ 'coc-go',
\ 'coc-marketplace',
\ 'coc-gitignore',
\ 'coc-git',
\ 'coc-yaml',
\ 'coc-vimlsp',
\ 'coc-tsserver',
\ 'coc-css',
\ 'coc-cssmodules',
\ '@yaegassy/coc-tailwindcss3',
\ 'coc-svelte',
\ 'coc-sql',
\ 'coc-rust-analyzer',
\ 'coc-python',
\ 'coc-markdownlint',
\ 'coc-import-cost',
\ 'coc-docker',
\ 'coc-flutter',
\ 'coc-html'
\ ]

function! s:CocUpdateCallback(err, ...) abort
	if a:err
		echo a:err
	else
		execute 'qa'
	endif
endfunction

command! CocUpdateQuit :call CocActionAsync('updateExtensions', v:false, function('<sid>CocUpdateCallback'))
