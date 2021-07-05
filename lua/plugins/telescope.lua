return function()
  vim.api.nvim_set_keymap("n", "<Leader>gs", [[<Cmd> Telescope git_status <CR>]], {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<Leader>cm", [[<Cmd> Telescope git_commits <CR>]], {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<Leader>f", [[<Cmd> Telescope find_files theme=get_ivy<CR>]], {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<Leader>lg", [[<Cmd> Telescope live_grep <CR>]], {noremap = true, silent = true})

  -- media_files plugin is not installed
  -- vim.api.nvim_set_keymap(
  --     "n",
  --     "<Leader>mf",
  --     [[<Cmd>lua require('telescope').extensions.media_files.media_files()<CR>]],
  --     {noremap = true, silent = true}
  -- )
  vim.api.nvim_set_keymap("n", "<Leader>b", [[<Cmd>Telescope buffers theme=get_ivy<CR>]], {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<Leader>of", [[<Cmd>Telescope oldfiles<CR>]], {noremap = true, silent = true})
end
