return function()
    vim.cmd("let g:neodark#italics = 1")
    -- Set colorscheme
    vim.cmd.colorscheme "neodark"

    vim.cmd("highlight NvimTreeNormal guibg=#172932")
    vim.cmd("highlight NvimTreeIndentMarker guifg=" .. vim.g.terminal_color_13)

    -- instead of default underline decorations
    vim.cmd("hi link IlluminatedWordText CursorLine")
    vim.cmd("hi link IlluminatedWordRead CursorLine")
    vim.cmd("hi link IlluminatedWordWrite CursorLine")

    -- indent-blankline uses Whitespace by default which is not set in neodark theme
    vim.cmd("highlight Whitespace guifg=" .. vim.g.terminal_color_13)

    -- fixes https://github.com/nvim-treesitter/nvim-treesitter/issues/3689
    vim.api.nvim_set_hl(0, "@string.special.symbol.elixir", {link = "Identifier"})
    vim.api.nvim_set_hl(0, "@module", {link = "Type"})

    -- set background for GitBlameVirtualText the same as background for CursorLine, as git blame virtual text
    -- is visible only on hover which is always CursorLine. FG color is a color of comments, as Git blame plugin
    -- uses Comment group by default
    vim.cmd(
        "highlight GitBlameVirtualText guibg=" ..
            vim.g.terminal_color_8 .. " guifg=" .. vim.g.terminal_color_7 .. " cterm=italic gui=italic"
    )
end
