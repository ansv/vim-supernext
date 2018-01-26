" vim-supernext - quickfix/paragraph/diff walker for vim
"
" Copyright (c) 2017-2018 Andrey Shvetsov
"
" SPDX-License-Identifier: MIT
"
" Description:
"
" if (diff mode)
"     "go to next/prev diff change"
" else if (quickfix mode)
"     "go to next/prev quickfix entry"
" else
"     "go to next/prev paragraph"
"
" Install:
"
" If you use junegunn/vim-plug:
" Add to your .vimrc
" Plug 'ansv/vim-supernext'


function! s:prev()
    if &diff
        execute "normal [c"
    else
        try
            execute "cprevious"
        catch /^Vim\%((\a\+)\)\=:E42:/
            execute "normal {"
        catch /^Vim\%((\a\+)\)\=:E553:/
            execute "clast"
        endtry
    endif
endfunction

function! s:next()
    if &diff
        execute "normal ]c"
    else
        try
            execute "cnext"
        catch /^Vim\%((\a\+)\)\=:E42:/
            execute "normal }"
        catch /^Vim\%((\a\+)\)\=:E553:/
            execute "cfirst"
        endtry
    endif
endfunction

nnoremap <silent><C-p> :call <SID>prev()<CR>
nnoremap <silent><C-n> :call <SID>next()<CR>

nnoremap <silent><C-Up>   :call <SID>prev()<CR>
nnoremap <silent><C-Down> :call <SID>next()<CR>

" vim: set sw=4 ts=4 et:
