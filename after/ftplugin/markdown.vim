nnoremap <localleader>cn o-<space>[<space>]<space>
function! g:GFMToggleChecklistItem()
  let l:current_line = getline(".")
  let l:line_start = strcharpart(current_line, 0, 5)
  let l:initial_pos = getpos(".")
  if line_start == "- [ ]"
    execute "normal! ^f[lrX"
  elseif line_start == "- [X]"
    execute "normal! ^f[lr\<space>"
  endif
  call setpos('.', initial_pos)
endfunction

nnoremap <localleader>cc :call GFMToggleChecklistItem()<CR>
