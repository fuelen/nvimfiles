vnoremap <leader>i sIO.inspect(<C-R>")<Esc>
vnoremap <leader>l sIO.inspect(<C-R>", label: "")<left><left>
nnoremap <leader>i viwsIO.inspect(<C-R>")<Esc>
nnoremap <leader>l viwsIO.inspect(<C-R>", label: "")<left><left>

let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

let elixir_module_with_function = '\%([A-Z]\+[a-z\dA-Z]\+\.\)*\k\+'
let elixir_variable = '\k\+'
" supported: atoms, module attributes and variables, anonymous functions
let elixir_values = '\%([:@]\{0,1}\k\+\)\|\%\(fn.\+end\)\|\%(&(.\+)\)'

let b:switch_custom_definitions =
      \ [
        \   {
          \     ('&\(' . elixir_module_with_function . '\)/1'): 'fn arg -> \1(arg) end',
          \     ('&\(' . elixir_module_with_function . '\)/2'): 'fn arg1, arg2 -> \1(arg1, arg2) end',
          \     ('&\(' . elixir_module_with_function . '\)/3'): 'fn arg1, arg2, arg3 -> \1(arg1, arg2, arg3) end',
          \     ('fn \('. elixir_variable .'\) -> \(' . elixir_module_with_function . '\)(\1) end'): '&\2/1',
          \     ('fn \('. elixir_variable .'\), \('. elixir_variable .'\) -> \(' . elixir_module_with_function . '\)(\1, \2) end'): '&\3/2',
          \     ('\(' . elixir_module_with_function . '\)(\('. elixir_values .'\),\s*'): '\2 |> \1(',
          \     ('\(' . elixir_module_with_function . '\)(\('. elixir_values .'\))'): '\2 |> \1()',
          \     ('\(' . elixir_values . '\)\s*|>\s*\(' . elixir_module_with_function . '\)()'): '\2(\1)',
          \     ('\(' . elixir_values . '\)\s*|>\s*\(' . elixir_module_with_function . '\)(\('. elixir_values .'\))'): '\2(\1, \3)',
          \     ('\(' . elixir_values . '\)\s*|>\s*\(' . elixir_module_with_function . '\)(\('. elixir_values .'\),\s*'): '\2(\1, \3, '
          \   },
          \ ]


" https://github.com/Chiel92/vim-autoformat/issues/236
" This is for umbrella applications.
" Try to find the closest '.formatter.exs' to the file currently being edited.
" If we find one, then pass that as context to the `mix format` command.
" Withouth this the `mix format -` has no context for the formatting so and
" cannot apply local project rules.
function! g:BuildMixFormatLocalCmd()
  let l:format_file = findfile('.formatter.exs', '.;')
  if format_file != ''
    return 'mix format --dot-formatter ' . format_file . ' -'
  else
    return 'mix format -'
  endif
endfunction
let g:formatdef_mix_format = "g:BuildMixFormatLocalCmd()"
