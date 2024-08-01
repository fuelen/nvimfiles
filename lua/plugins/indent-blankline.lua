-- return function()
--     require("indent_blankline").setup {
--         show_first_indent_level = false,
--         char = "┊",
--         char_blankline = "",
--         filetype_exclude = {
--             -- default
--             "lspinfo",
--             "packer",
--             "checkhealth",
--             "help",
--             "man",
--             "",
--             -- custom
--             "startify"
--         }
--     }
-- end

return function()
    local hooks = require("ibl.hooks")
    hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)

    require("ibl").setup({
        enabled = true,
        indent = { char = "┊" },
        scope = { enabled = false },
        exclude = {
            filetypes = {
                "lspinfo",
                "packer",
                "checkhealth",
                "help",
                "man",
                "gitcommit",
                "TelescopePrompt",
                "TelescopeResults",
                "",
                -- custom
                "startify",
            },
        },
    })
end
