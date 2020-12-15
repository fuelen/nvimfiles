function! g:GFMToggleChecklistItem()
  let l:current_line = getline(".")
  let l:line_start = strcharpart(current_line, 0, 5)
  let l:initial_pos = getpos(".")
  if line_start == "- [ ]"
    execute "normal! ^f[lrX"
  elseif line_start == "- [X]"
    execute "normal! ^f[lr\<space>"
  else
    echoerr "Not a checklist item under cursor"
  endif
  call setpos('.', initial_pos)
endfunction

function! g:GFMAppendCheckListItem()
  if line('$') == 1 && getline(1) == ''
    execute "normal! ^i-\<space>[\<space>]\<space>"
  else
    execute "normal! o-\<space>[\<space>]\<space>"
  endif
endfunction

nnoremap <localleader>cc :call GFMToggleChecklistItem()<CR>
nnoremap <localleader>cn :call GFMAppendCheckListItem()<CR>

set wrap linebreak nolist
