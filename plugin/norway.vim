" Making VIM keybindigs more sensible for Norwegians
" Date: 2018-08-04
"
" Maintainer:	Gaute Hope <eg@gaute.vetsj.com>
" Last Changed:	2021-09-05


function! EnableNorway()
  " non-INSERT mode
  set langmap=`\\,¤$,ø[,æ],Ø{,Æ}
  map , /

  " INSERT mode
  set keymap=norway

  set spelllang=nn
endfunction

function! DisableNorway()
  set langmap=
  unmap ,

  " INSERT mode
  set keymap=

  set spelllang=en
endfunction


" Toggle norwegian keys and spell language
"
" Use ToggleNorway(1) to force norwegian and
"     ToggleNorway(0) to force english.
"
function! ToggleNorway(...)
  if a:0 > 0
    let g:no_key = a:1
  else
    let g:no_key = (get(g:, 'no_key', -1) + 1) % 2
  endif
  if g:no_key == 1
    call DisableNorway()


    if !has('vim_starting')
      echomsg "language: norwegian"
    endif
  else
    call EnableNorway()

    if !has('vim_starting')
      echomsg "language: english"
    endif
  endif
endfunction

if has('vim_starting') && get(g:, 'norway_enable_at_startup', 1) == 1
  call ToggleNorway(0)
endif

augroup Norway
  au!
  au VimEnter * nnoremap <silent> yon :call ToggleNorway()<CR>
augroup end

