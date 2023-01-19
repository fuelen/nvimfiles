return function()
    local wk = require("which-key")
    wk.setup()
    wk.register({["<leader>s"] = {name = "Grep"}}, {mode = "v"})

    -- tests
    wk.register({["<leader>tn"] = {name = "Test nearest"}}, {mode = "n"})
    wk.register({["<leader>tf"] = {name = "Test current file"}}, {mode = "n"})
    wk.register({["<leader>tu"] = {name = "Undo test (stop)"}}, {mode = "n"})
    wk.register({["<leader>ts"] = {name = "Tests summary"}}, {mode = "n"})
    wk.register({["<leader>to"] = {name = "Test output"}}, {mode = "n"})

    -- telescope
    wk.register({["<leader>f"] = {name = "Find files"}}, {mode = "n"})
    wk.register({["<leader>lg"] = {name = "Live Grep"}}, {mode = "n"})
    wk.register({["<leader>b"] = {name = "Buffers"}}, {mode = "n"})

    -- translator
    wk.register({["<leader>tr"] = {name = "Google Translate"}}, {mode = "n"})
    wk.register({["<leader>tr"] = {name = "Google Translate"}}, {mode = "v"})

  -- nvim-tree
    wk.register({["<leader>p"] = {name = "File Tree"}}, {mode = "n"})

    -- core - mappings from configuration.lua
    wk.register({["<leader><space>"] = {name = "Clear last search highlight"}}, {mode = "n"})
end
