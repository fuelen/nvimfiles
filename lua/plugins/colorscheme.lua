return function()
    -- most of the colors are from this colorscheme https://github.com/KeitaNakamura/neodark.vim

    local palettes = {
        nightfox = {
            red = "#DC657D",
            green = "#84B97C",
            yellow = "#D4AE58",
            blue = "#639EE4",
            magenta = "#B888E2",
            cyan = "#4BB1A7",
            white = "#AABBC4",
            orange = "#C99720",
            pink = "#DC94A2",
            comment = "#658595",
            -- Darker bg (status line and float)
            bg0 = "#172932",
            -- Default bg
            bg1 = "#1F2F38",
            -- Lighter bg (colorcolumn folds)
            bg2 = "#263A45",
            -- Lighter bg (cursor line)
            bg3 = "#263A45",
            -- Lighter bg (Conceal, border fg)
            bg4 = "#475C69",
            --Lighter fg - don't know where it is used
            -- fg0 = "#ff0000",
            --Default fg
            fg1 = "#AABBC4",
            --Darker fg (status line)
            fg2 = "#AABBC4",
            --Darker fg (line numbers, fold columns)
            fg3 = "#475C69",
            --Popup bg (will be overriden by Pmenu hl instructions), visual selection bg
            sel0 = "#374B57",
            --Popup sel bg, search bg
            sel1 = "#475C69"
        }
    }

    local specs = {
        nightfox = {
            syntax = {
                operator = "green",
                type = "yellow",
                variable = "cyan",
                const = "red",
                func = "blue",
                preproc = "green",
                keyword = "green",
                builtin1 = "yellow",
                builtin2 = "pink",
                ident = "cyan",
                string = "#E18254"
            }
        }
    }
    local options = {styles = {comments = "italic"}}

    require("nightfox").setup(
        {
            options = options,
            palettes = palettes,
            specs = specs
        }
    )

    vim.cmd.colorscheme "nightfox"
    -- set background for GitBlameVirtualText the same as background for CursorLine, as git blame virtual text
    -- is visible only on hover which is always CursorLine.
    vim.api.nvim_set_hl(
        0,
        "GitBlameVirtualText",
        {bg = palettes.nightfox.bg3, fg = palettes.nightfox.comment, italic = true}
    )
    vim.api.nvim_set_hl(0, "Search", {fg = palettes.nightfox.orange, bg = palettes.nightfox.bg4, bold = true})

    -- highlight group that is used by vim-current-search-match plugin by default
    vim.api.nvim_set_hl(0, "PmenuSel", {fg = palettes.nightfox.bg2, bg = palettes.nightfox.green})

    -- override, as sel0 that is used for selection as well, is too light for autocomplete background
    vim.api.nvim_set_hl(0, "Pmenu", {bg = palettes.nightfox.bg3})

    -- explicitly set green color, as in the theme this group is linked to itself
    -- https://github.com/EdenEast/nightfox.nvim/blob/a408e6bb101066952b81de9c11be367114bd561f/lua/nightfox/group/modules/nvimtree.lua#L30
    vim.api.nvim_set_hl(0, "NvimTreeGitStaged", {fg = palettes.nightfox.green})
    vim.api.nvim_set_hl(0, "NvimTreeGitNew", {fg = palettes.nightfox.yellow})
    vim.api.nvim_set_hl(0, "NvimTreeGitDirty", {fg = palettes.nightfox.pink})

    -- make IlluminatedWord* the same as CursorLine, so it doesn't blink during writing
    vim.api.nvim_set_hl(0, "IlluminatedWordText", {link = "CursorLine"})
    vim.api.nvim_set_hl(0, "IlluminatedWordRead", {link = "CursorLine"})
    vim.api.nvim_set_hl(0, "IlluminatedWordWrite", {link = "CursorLine"})

    -- special highlighting for Elixir atoms
    vim.api.nvim_set_hl(0, "@string.special.symbol.elixir", {link = "Identifier"})

    -- nightfox doesn't display italic as italic for some reason:
    -- https://github.com/EdenEast/nightfox.nvim/blob/a408e6bb101066952b81de9c11be367114bd561f/lua/nightfox/group/modules/treesitter.lua#L96
    vim.api.nvim_set_hl(0, "@markup.italic", {italic = true})

    -- I got used to more visible separator of splits
    vim.api.nvim_set_hl(0, "WinSeparator", {link = "Comment"})
end
