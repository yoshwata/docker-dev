
" Simple debugger integration.

fu! g:SendDBBreak()
	call system("tmux send-keys -t right 'sb(" . line('.') . ")\n'")
endfu

fu! g:SendDBCmd(cmd)
	call system("tmux send-keys -t right '" . a:cmd . "\n'")
endfu

au FileType javascript nnoremap <buffer> ,b :call g:SendDBBreak()<cr>
au FileType javascript nnoremap <buffer> ,s :call g:SendDBCmd('s')<cr>
au FileType javascript nnoremap <buffer> ,n :call g:SendDBCmd('n')<cr>
au FileType javascript nnoremap <buffer> ,c :call g:SendDBCmd('c')<cr>
au FileType javascript nnoremap <buffer> ,r :call g:SendDBCmd('r')<cr>
au FileType javascript nnoremap <buffer> ,R :call g:SendDBCmd('restart')<cr>

" Enable jsx by default as many projects use .js extension for jsx files.
let g:jsx_ext_required = 0

let g:deoplete#enable_at_startup = 1

call deoplete#custom#source('LanguageClient',
            \ 'min_pattern_length',
            \ 2)

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

let g:LanguageClient_diagnosticsList = 'Disabled'
let g:LanguageClient_serverCommands = {
		\ 'typescript': ['~/.yarn/bin/javascript-typescript-stdio'],
		\ 'javascript': ['~/.yarn/bin/javascript-typescript-stdio'],
		\ 'javascript.jsx': ['~/.yarn/bin/javascript-typescript-stdio'],
		\ }
