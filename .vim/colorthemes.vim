" Disable Background Color Erase (BCE) so that color schemes
" render properly when inside 256-color tmux and GNU screen.
if &term =~ '256color'
    set t_ut=
endif

function! s:SetDracula()
	let g:dracula_italic = 0
 	colorscheme dracula
 	let g:airline_theme = "dracula"
endfunction


function! s:SetMolokai()
	colorscheme molokai
	let g:airline_theme = "molokai"
endfunction

function! s:SetOne()
	colorscheme one
	let g:airline_theme = "one"
	highlight Pmenu ctermfg=white
	highlight PmenuSel ctermbg=68 ctermfg=black
endfunction


set background=dark

"call s:SetDracula()
"call s:SetMolokai()
call s:SetOne()

highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

