return function()
  vim.api.nvim_set_keymap("n", "//", ":TComment<CR>", {noremap = true})
  vim.api.nvim_set_keymap("v", "//", ":TComment<CR>", {noremap = true})

  -- this line doesn't work without direnv/direnv.vim plugin, because it defines direnv filetype
  vim.fn["tcomment#type#Define"]("direnv", "# %s")
end
