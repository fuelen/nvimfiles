return function()
    vim.api.nvim_set_keymap("", "w", "<Plug>CamelCaseMotion_w", {})
    vim.api.nvim_set_keymap("", "b", "<Plug>CamelCaseMotion_b", {})
    vim.api.nvim_set_keymap("", "e", "<Plug>CamelCaseMotion_e", {})
    vim.api.nvim_set_keymap("", "ge", "<Plug>CamelCaseMotion_ge", {})
end
