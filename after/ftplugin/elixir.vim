vnoremap <leader>i sIO.inspect(<C-R>")<Esc>
vnoremap <leader>l sIO.inspect(<C-R>", label: "")<left><left>
nnoremap <leader>i viwsIO.inspect(<C-R>")<Esc>
nnoremap <leader>l viwsIO.inspect(<C-R>", label: "")<left><left>

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
          \   g:switch_builtins.ruby_hash_style
          \ ]
