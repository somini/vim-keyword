" keyword: Set the keyword option to sensible defaults
" Maintainer:  somini <https://github.com/somini>
" Version:     1.0

" Script guard and default variables {{{
if exists('g:loaded_keyword')
	finish
endif
let g:loaded_keyword = 1
"}}}

" TODO: Detect if it's a dictionary
if !exists('g:keyword')
	let g:keyword = {}
endif

let s:keyword_defaults = {
\	'vim': ':help',
\	'help': ':help',
\	'c': 'man -Tutf8 --sections=2,3',
\}

function SetKeyword()
	let l:keyword = get(g:keyword, &filetype, get(s:keyword_defaults, &filetype, ''))
	if !empty(l:keyword)
		let &l:keywordprg = l:keyword
	endif
endfunction

augroup keyword
	autocmd FileType * call SetKeyword()
augroup END

" Modeline and other administrativia {{{
" vim: ts=2:sw=2:ft=vim:fdm=marker
