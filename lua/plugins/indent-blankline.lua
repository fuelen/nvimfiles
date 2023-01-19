return function()
    require("indent_blankline").setup {
        show_first_indent_level = false,
        char = "┊",
        char_blankline = "",
        filetype_exclude = {
            -- default
            "lspinfo",
            "packer",
            "checkhealth",
            "help",
            "man",
            "",
            -- custom
            "startify"
        }
    }
end
