return function()
    require("conform").setup({
        formatters_by_ft = {
            lua = { "stylua" },
            css = { "prettier" },
            html = { "prettier" },
            graphql = { "typos", "prettier" },
            typescript = { "typos", "prettier" },
            typescriptreact = { "typos", "prettier" },
            javascript = { "typos", "prettier" },
            elixir = { "typos", "mix" },
            sql = { "pg_format" },
            json = { "prettier" },
            python = { "ruff_format" },
            ["_"] = { "trim_whitespace", "trim_newlines" },
        },
    })
    vim.api.nvim_create_user_command("Format", function(args)
        local range = nil
        if args.count ~= -1 then
            local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
            range = {
                start = { args.line1, 0 },
                ["end"] = { args.line2, end_line:len() },
            }
        end
        require("conform").format({ async = true, lsp_format = "fallback", range = range })
    end, { range = true })

    vim.api.nvim_set_keymap("n", "===", ":Format<CR>", { noremap = true })
end
