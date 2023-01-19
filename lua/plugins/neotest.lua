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
    -- test nearest
    vim.api.nvim_set_keymap("n", "<leader>tn", ':lua require("neotest").run.run()<CR>', {noremap = true})
    -- test file
    vim.api.nvim_set_keymap(
        "n",
        "<leader>tf",
        ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>',
        {noremap = true}
    )
    -- stop nearest test (undo - use u because it is used in summary window as well)
    vim.api.nvim_set_keymap("n", "<leader>tu", ':lua require("neotest").run.stop()<CR>', {noremap = true})
    -- test summary
    vim.api.nvim_set_keymap("n", "<leader>ts", ':lua require("neotest").summary.toggle()<CR>', {noremap = true})
    -- test output
    vim.api.nvim_set_keymap(
        "n",
        "<leader>to",
        ':lua require("neotest").output.open({ enter = false })<CR>',
        {noremap = true}
    )
end
