return function()
    lspconfig = require("lspconfig")

    local on_attach = function(client, bufnr)
        local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        -- Mappings.
        local opts = {noremap = true, silent = true}

        -- See `:help vim.lsp.*` for documentation on any of the below functions
        buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
        buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
        buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
        buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
        buf_set_keymap("n", "<space>sh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
        buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
        buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
        buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
        buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
        buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
        buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
        buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
        buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
        buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
        buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
        buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", opts)
        buf_set_keymap("n", "<leader>dd", "<cmd> lua vim.diagnostic.open_float()<CR>", opts)
    end

    local manipulate_pipes = function(command)
        return function()
            local position_params = vim.lsp.util.make_position_params()
            vim.lsp.buf.execute_command(
                {
                    command = "manipulatePipes:" .. command,
                    arguments = {
                        command,
                        position_params.textDocument.uri,
                        position_params.position.line,
                        position_params.position.character
                    }
                }
            )
        end
    end

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- commented because it is slow as hell and consumes a lot of CPU
    -- lspconfig.elixirls.setup {
    --     on_attach = function(client, bufnr)
    --       on_attach(client, bufnr)
    --       vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
    --         buffer = bufnr,
    --         callback = vim.lsp.codelens.refresh,
    --       })
    --
    --       vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>tp", ":ToPipe<CR>", {noremap = true})
    --       vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>fp", ":FromPipe<CR>", {noremap = true})
    --     end,
    --     cmd = {"/home/fuelen/projects/elixir-ls/language_server.sh"},
    --     settings = {
    --         elixirLS = {
    --             dialyzerEnabled = false,
    --         --     dialyzerFormat = "dialyxir_short",
    --             suggestSpecs = false,
    --             enableTestLenses = false
    --         }
    --     },
    --     commands = {
    --         ToPipe = {manipulate_pipes("toPipe"), "Convert function call to pipe operator"},
    --         FromPipe = {manipulate_pipes("fromPipe"), "Convert pipe operator to function call"}
    --     },
    --     capabilities = capabilities
    -- }
    lspconfig.tsserver.setup {
        on_attach = on_attach,
        capabilities = capabilities
    }

    lspconfig.nextls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = {"/home/artur/projects/next-ls/burrito_out/next_ls_linux_amd64", "--stdio"},
        init_options = {
            extensions = {
                credo = {enable = true}
            },
            experimental = {
                completions = {enable = true}
            }
        }
    }
end
