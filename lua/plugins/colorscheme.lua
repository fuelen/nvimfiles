return function()
    -- Set colorscheme
    vim.cmd.colorscheme 'neodark'

    vim.cmd("highlight NvimTreeNormal guibg=#172932")
    vim.cmd("highlight NvimTreeIndentMarker guifg=" .. vim.g.terminal_color_13)

    -- instead of default underline decorations
    vim.cmd("hi link IlluminatedWordText CursorLine")
    vim.cmd("hi link IlluminatedWordRead CursorLine")
    vim.cmd("hi link IlluminatedWordWrite CursorLine")

    -- fixes https://github.com/nvim-treesitter/nvim-treesitter/issues/3689
    vim.api.nvim_set_hl(0, "@symbol", { link = "Identifier" })
end
