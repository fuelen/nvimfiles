return function()
    -- vim.api.nvim_set_keymap("n", "<leader>dvc", ":DiffviewClose", {noremap = false, desc = "Close Diffview"})
    diffview_toggle = function()
        local lib = require("diffview.lib")
        local view = lib.get_current_view()
        if view then
            -- Current tabpage is a Diffview; close it
            vim.cmd.DiffviewClose()
        else
            -- No open Diffview exists: open a new one
            vim.cmd.DiffviewOpen()
        end
    end

    vim.api.nvim_set_keymap("n", "<leader>dv", "<cmd>lua diffview_toggle()<CR>", {desc = "Toggle diffview"})
end
