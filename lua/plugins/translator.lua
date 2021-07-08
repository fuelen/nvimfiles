return function()
    vim.g.translator_target_lang = "uk"

    vim.api.nvim_set_keymap("n", "<leader>tr", "<Plug>TranslateW", {noremap = false})
    vim.api.nvim_set_keymap("v", "<leader>tr", "<Plug>TranslateWV", {noremap = false})
end
