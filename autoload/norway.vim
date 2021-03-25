" Making VIM keybindigs more sensible for Norwegians
" Date: 2018-08-04

" when not in insert mode, remap some non-US keys
map , /
" noremap M ,
map ´ \
" map ; ?

map  ¤ $
imap ¤ $
nmap ¤ $
vmap ¤ $
cmap ¤ $
xmap ¤ $
lmap ¤ $
smap ¤ $
omap ¤ $
vmap S¤ S$
nmap g¤ g$

" Use ØÆ for brackets
map  ø [
map! ø [
map  æ ]
map! æ ]
map  Ø {
map! Ø {
map  Æ }
map! Æ }
map  rø r[
map  rØ r{
map  ræ r]
map  rÆ r}
vmap Sø S[
vmap SØ S{
vmap Sæ S]
vmap SÆ S}

" Toggle norwegian keys and spell language
"
" Use ToggleNoKey(1) to force norwegian and
"     ToggleNoKey(0) to force english.
"
function! ToggleNoKey(...)
  if a:0 > 0
    let g:no_key = a:1
  else
    let g:no_key = (get(g:, 'no_key', -1) + 1) % 2
  endif
  if g:no_key == 1
    iunmap ø
    iunmap Ø
    iunmap æ
    iunmap Æ
    set spelllang=nn
    if !has('vim_starting')
      echomsg "language: norwegian"
    endif
  else
    " for english layout
    inoremap \[ å
    inoremap \' æ
    inoremap \; ø
    inoremap \[[ Å
    inoremap \'' Æ
    inoremap \;; Ø

    " for norwegian layout
    imap ø [
    imap æ ]
    imap Ø {
    imap Æ }
    set spelllang=en
    if !has('vim_starting')
      echomsg "language: english"
    endif
  endif
endfunction

if has('vim_starting')
  call ToggleNoKey(0)
endif

augroup Norway
  au!
  au VimEnter * nnoremap <silent> yon :call ToggleNoKey()<CR>
augroup end

