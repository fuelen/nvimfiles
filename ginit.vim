" neovim-qt specific options
if exists(':GuiFont')
  let s:fontsize = 12
  let s:font = "DejaVu Sans Mono"

  " AdjustFontSize functionality taken from https://stackoverflow.com/a/51424640
  function! AdjustFontSize(amount)
    let s:fontsize = s:fontsize+a:amount
    :execute "GuiFont! ". s:font . ":h". s:fontsize
  endfunction

  " change font size using mouse wheel
  noremap <C-ScrollWheelUp> :call AdjustFontSize(1)<CR>
  noremap <C-ScrollWheelDown> :call AdjustFontSize(-1)<CR>
  inoremap <C-ScrollWheelUp> <Esc>:call AdjustFontSize(1)<CR>a
  inoremap <C-ScrollWheelDown> <Esc>:call AdjustFontSize(-1)<CR>a

  " pressing numpad's + and - changes the font size
  noremap <kPlus> :call AdjustFontSize(1)<CR>
  noremap <kMinus> :call AdjustFontSize(-1)<CR>

  :execute "GuiFont! ". s:font . ":h". s:fontsize

  GuiTabline 0
  GuiPopupmenu 0
end
