return function()
  vim.api.nvim_set_keymap("", "<leader>p", ":NERDTreeToggle<CR>", {noremap = true})
  vim.api.nvim_set_keymap("", "<C-F>", ":NERDTreeFind<CR>", {noremap = true})
end
