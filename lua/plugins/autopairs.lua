return function()
    local npairs = require("nvim-autopairs")
    npairs.setup()
    require("nvim-autopairs.completion.compe").setup(
        {
            map_cr = true, --  map <CR> on insert mode
            map_complete = true -- it will auto insert `(` after select function or method item
        }
    )

    -- TODO: uncomment when https://github.com/windwp/nvim-autopairs/issues/74 is solved
    -- local endwise = require("nvim-autopairs.ts-rule").endwise
    -- npairs.add_rules(require("nvim-autopairs.rules.endwise-lua"))
    --
    -- npairs.add_rules(
    --     {
    --         -- then$ is a lua regex
    --         -- end is a match pair
    --         -- lua is a filetype
    --         -- if_statement is a treesitter name. set it = nil to skip check with treesitter
    --         endwise(" do$", "end", "elixir", nil)
    --     }
    -- )
end
