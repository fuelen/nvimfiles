return function()
    require("neotest").setup(
        {
            adapters = {
                require("neotest-elixir")
            },
            -- there are quickfix errors possibly related to nvim-bqf, so disable it for now
            quickfix = {
                enabled = false
            }
        }
    )
    vim.api.nvim_set_keymap(
        "n",
        "<leader>tn",
        ':lua require("neotest").run.run()<CR>',
        {noremap = true, desc = "Test nearest"}
    )
    vim.api.nvim_set_keymap(
        "n",
        "<leader>tf",
        ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>',
        {noremap = true, desc = "Test current file"}
    )

    vim.api.nvim_set_keymap(
        "n",
        "<leader>ta",
        ':lua require("neotest").run.attach()<CR>',
        {noremap = true, desc = "Attach to running test"}
    )

    -- (undo - use u because it is used in summary window as well)
    vim.api.nvim_set_keymap(
        "n",
        "<leader>tu",
        ':lua require("neotest").run.stop()<CR>',
        {noremap = true, desc = "Stop nearest test"}
    )
    vim.api.nvim_set_keymap(
        "n",
        "<leader>ts",
        ':lua require("neotest").summary.toggle()<CR>',
        {noremap = true, desc = "Test summary"}
    )
    vim.api.nvim_set_keymap(
        "n",
        "<leader>to",
        ':lua require("neotest").output.open({ enter = false })<CR>',
        {noremap = true, desc = "Test output"}
    )
end
