return function()
    vim.api.nvim_set_keymap("n", "<leader>s", ":Grep<space>", { desc = "Grep" })
    vim.api.nvim_set_keymap("v", "<leader>s", "y:Grep<space><C-r>+", { desc = "Grep selected text" })

    vim.g.EasyGrepMode = 0 -- all files
    vim.g.EasyGrepCommand = 1 -- grep instead of vimgrep
    vim.g.EasyGrepRecursive = 1
    vim.g.EasyGrepSearchCurrentBufferDir = 1
    vim.g.EasyGrepIgnoreCase = 1
    vim.g.EasyGrepHidden = 0
    vim.g.EasyGrepBinary = 0
    vim.g.EasyGrepFilesToInclude = ""
    vim.g.EasyGrepFilesToExclude =
        "*.swp,*~,*.beam,*webpack_bundle.js,__generated__,graphql-schema.json,*.chunk.js,*.chunk.js.map,*.worker.js,*.log,_build/,.elixir-tools/,node_modules,erl_crash.dump,*.sql,coverage/,tmp/,.docker/,doc/,cover/,.elixir_ls,.git"
    vim.g.EasyGrepAllOptionsInExplorer = 1
    vim.g.EasyGrepWindow = 0
    vim.g.EasyGrepReplaceWindowMode = 0
    vim.g.EasyGrepOpenWindowOnMatch = 1
    vim.g.EasyGrepEveryMatch = 0
    vim.g.EasyGrepJumpToMatch = 1
    vim.g.EasyGrepInvertWholeWord = 0
    vim.g.EasyGrepPatternType = "regex"
    vim.g.EasyGrepFileAssociationsInExplorer = 0
    vim.g.EasyGrepExtraWarnings = 0
    vim.g.EasyGrepOptionPrefix = "<leader>vy"
    vim.g.EasyGrepReplaceAllPerFile = 0
end
