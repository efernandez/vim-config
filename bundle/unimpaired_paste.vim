" From unimpaired.vim
" https://github.com/tpope/vim-unimpaired/blob/master/plugin/unimpaired.vim
"
" Local modifications: added "yi".

function! s:setup_paste() abort
  let s:paste = &paste
  let s:mouse = &mouse
  set paste
  set mouse=
endfunction

nnoremap <silent> <Plug>unimpairedPaste :call <SID>setup_paste()<CR>

nnoremap <silent> yp  :call <SID>setup_paste()<CR>a
nnoremap <silent> yP  :call <SID>setup_paste()<CR>i
nnoremap <silent> yo  :call <SID>setup_paste()<CR>o
nnoremap <silent> yO  :call <SID>setup_paste()<CR>O
nnoremap <silent> yA  :call <SID>setup_paste()<CR>A
nnoremap <silent> yi  :call <SID>setup_paste()<CR>I
nnoremap <silent> yI  :call <SID>setup_paste()<CR>I
nnoremap <silent> ygi :call <SID>setup_paste()<CR>gi
nnoremap <silent> ygI :call <SID>setup_paste()<CR>gI

augroup unimpaired_paste
  autocmd!
  autocmd InsertLeave *
        \ if exists('s:paste') |
        \   let &paste = s:paste |
        \   let &mouse = s:mouse |
        \   unlet s:paste |
        \   unlet s:mouse |
        \ endif
augroup END
