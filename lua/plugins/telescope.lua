return function()
    vim.api.nvim_set_keymap("n", "<Leader>cm", [[<Cmd> Telescope git_commits <CR>]], {noremap = true, silent = true})
    vim.api.nvim_set_keymap(
        "n",
        "<Leader>f",
        [[<Cmd> Telescope find_files theme=get_ivy prompt_prefix=🔍\ <CR>]],
        {noremap = true, silent = true, desc = "Find files"}
    )
    vim.api.nvim_set_keymap(
        "n",
        "<Leader>lg",
        [[<Cmd> Telescope live_grep theme=get_ivy prompt_prefix=🔍\ <CR>]],
        {noremap = true, silent = true, desc = "Live Grep"}
    )

    vim.api.nvim_set_keymap(
        "n",
        "<Leader>b",
        [[<Cmd>Telescope buffers theme=get_ivy sort_lastused=true<CR>]],
        {noremap = true, silent = true, desc = "Buffers"}
    )

    -- https://www.reddit.com/r/neovim/comments/qspemc/close_buffers_with_telescope/
    require("telescope").setup {
        defaults = {
            mappings = {
                n = {
                    ["<c-d>"] = require("telescope.actions").delete_buffer
                },
                i = {
                    ["<C-h>"] = "which_key",
                    ["<c-d>"] = require("telescope.actions").delete_buffer
                }
            }
        }
    }
end
