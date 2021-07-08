return function()
    vim.api.nvim_set_keymap("", "<leader>s", ":Grep<space>", {})
    vim.api.nvim_set_keymap("v", "<leader>s", "y:Grep<space><C-r>+", {})

    vim.g.EasyGrepMode = 0 -- all files
    vim.g.EasyGrepCommand = 1 -- grep instead of vimgrep
    vim.g.EasyGrepRecursive = 1
    vim.g.EasyGrepSearchCurrentBufferDir = 1
    vim.g.EasyGrepIgnoreCase = 1
    vim.g.EasyGrepHidden = 0
    vim.g.EasyGrepBinary = 0
    vim.g.EasyGrepFilesToInclude = ""
    vim.g.EasyGrepFilesToExclude =
        "*.swp,*~,*.beam,*webpack_bundle.js,*.worker.js,*.log,_build/,node_modules,erl_crash.dump,*.sql,coverage/,tmp/,.docker/,doc/"
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
