return function()
    vim.g.gitblame_date_format = "%r"
    vim.g.gitblame_ignored_filetypes = { "NvimTree" }
    vim.g.gitblame_highlight_group = "GitBlameVirtualText"
end
