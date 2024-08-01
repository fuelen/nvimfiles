return function()
    lspconfig = require("lspconfig")

    local on_attach = function(client, bufnr)
        local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        -- Mappings.
        local opts = { noremap = true, silent = true }

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
            vim.lsp.buf.execute_command({
                command = command,
                arguments = {
                    {
                        uri = position_params.textDocument.uri,
                        position = position_params.position,
                    },
                },
            })
        end
    end

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    lspconfig.tsserver.setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })

    lspconfig.typos_lsp.setup({
        -- Logging level of the language server. Logs appear in :LspLog. Defaults to error.
        cmd_env = { RUST_LOG = "error" },
        init_options = {
            -- How typos are rendered in the editor, can be one of an Error, Warning, Info or Hint.
            -- Defaults to error.
            diagnosticSeverity = "Info",
        },
    })
    lspconfig.jedi_language_server.setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })

    lspconfig.nextls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { "/home/artur/projects/next-ls/burrito_out/next_ls_linux_amd64", "--stdio" },
        commands = {
            ToPipe = { manipulate_pipes("to-pipe"), "Convert function call to pipe operator" },
            FromPipe = { manipulate_pipes("from-pipe"), "Convert pipe operator to function call" },
        },
        init_options = {
            extensions = {
                credo = { enable = true },
            },
            experimental = {
                completions = { enable = true },
            },
        },
    })

    local function all_env_vars_set(env_variables)
        for _, varName in ipairs(env_variables) do
            if not os.getenv(varName) then
                return false
            end
        end
        return true
    end

    if
        all_env_vars_set({ "DATABASE_HOST", "DATABASE_PORT", "DATABASE_USERNAME", "DATABASE_PASSWORD", "DATABASE_NAME" })
    then
        lspconfig.sqls.setup({
            on_attach = function(client, bufnr)
                require("sqls").on_attach(client, bufnr) -- require sqls.nvim
                on_attach(client, bufnr)
            end,
            settings = {
                sqls = {
                    connections = {
                        {
                            driver = "postgresql",
                            dataSourceName = "host=" .. os.getenv("DATABASE_HOST") .. " port=" .. os.getenv(
                                "DATABASE_PORT"
                            ) .. " user=" .. os.getenv("DATABASE_USERNAME") .. " password=" .. os.getenv(
                                "DATABASE_PASSWORD"
                            ) .. " dbname=" .. os.getenv("DATABASE_NAME") .. " sslmode=disable",
                        },
                    },
                },
            },
        })
    end
end
