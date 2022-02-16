return function()
    -- Set colorscheme
    vim.cmd [[ colorscheme neodark ]]

    vim.cmd("highlight NvimTreeNormal guibg=#172932")
    vim.cmd("highlight NvimTreeIndentMarker guifg=" .. vim.g.terminal_color_13)
end
