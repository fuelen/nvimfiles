return function()
    vim.api.nvim_set_keymap("n", "===", ":Autoformat<CR>", {noremap = true})
    -- autoformat on save
    vim.api.nvim_exec([[
      au BufWrite * :Autoformat
    ]], false)
end
