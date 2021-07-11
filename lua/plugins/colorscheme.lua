return function()
    -- Set colorscheme
    vim.cmd [[ colorscheme neodark ]]

    -- indent-blankline plugin uses Whitespace as a default color
    -- neodark doesn't have this setting, but it has specific settings for indentLine plugin,
    -- the same color is written to vim.g.terminal_color_13 so we simply reuse it.
    -- Ideally, neodark theme should set color for Whitespace.
    vim.cmd("highlight Whitespace guifg=" .. vim.g.terminal_color_13 .. " gui=nocombine")

    vim.cmd("highlight NvimTreeNormal guibg=#172932")
    vim.cmd("highlight NvimTreeIndentMarker guifg=" .. vim.g.terminal_color_13)
end
