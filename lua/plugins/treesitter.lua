return function()
    local ts_config = require("nvim-treesitter.configs")

    ts_config.setup({
        ensure_installed = {
            "markdown",
            "markdown_inline",
            "bash",
            "css",
            "erlang",
            "elixir",
            "graphql",
            "javascript",
            "typescript",
            "tsx",
            "json",
            "lua",
            "html",
            "yaml",
            "heex",
            "eex",
        },
        highlight = {
            enable = true,
            use_languagetree = true,
        },
        indent = {
            enable = true,
        },
    })

    -- I couldn't make folding work, so disabling for now
    -- vim.opt.foldmethod = "expr"
    -- vim.opt.foldexpr = vim.fn["nvim_treesitter#foldexpr"]()
end
