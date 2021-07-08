_G.nvim_tree_find_file = function()
    local function starts_with(String, Start)
        return string.sub(String, 1, string.len(Start)) == Start
    end

    local cwd = vim.fn.getcwd()
    local cur_path = vim.fn.expand("%:p:h")

    if starts_with(cur_path, cwd) then
        require("nvim-tree").find_file(true)
    else
        require("nvim-tree").refresh()
        require("nvim-tree.lib").change_dir(cur_path)
        require("nvim-tree").find_file(true)
        vim.cmd("cd " .. cwd)
    end
end

return function()
    vim.api.nvim_set_keymap("", "<leader>p", ":NvimTreeToggle<CR>", {noremap = true})
    vim.api.nvim_set_keymap("", "<C-F>", ":lua _G.nvim_tree_find_file()<CR>", {noremap = true})
    vim.g.nvim_tree_hide_dotfiles = 1
    vim.g.nvim_tree_git_hl = 1
    vim.g.nvim_tree_icons = {
        -- default the only icon that is changed
        default = "",
        symlink = "",
        git = {
            unstaged = "✗",
            staged = "✓",
            unmerged = "",
            renamed = "➜",
            untracked = "★",
            deleted = "",
            ignored = "◌"
        },
        folder = {
            arrow_open = "",
            arrow_closed = "",
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
            symlink_open = ""
        },
        lsp = {
            hint = "",
            info = "",
            warning = "",
            error = ""
        }
    }
end
