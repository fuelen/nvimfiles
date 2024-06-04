return function()
    vim.o.completeopt = "menuone,noselect"
    local lspkind = require("lspkind")
    local cmp = require("cmp")
    cmp.setup {
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end
        },
        formatting = {
            format = lspkind.cmp_format(
                {
                    mode = "symbol", -- show only symbol annotations
                    maxwidth = 50 -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                }
            )
        },
        mapping = {
            ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
            ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
            ["<C-e>"] = cmp.mapping(
                {
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close()
                }
            ),
            -- <CR> must have select=false, otherwise endwise rule (do-end) of autopairs plugin doesn't work
            ["<CR>"] = cmp.mapping.confirm({select = false}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), {"i", "c"}),
            ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), {"i", "c"})
        },
        sources = {
            {name = "nvim_lsp"},
            {name = "luasnip"},
            {
                name = "buffer",
                -- Visible buffers
                option = {
                    get_bufnrs = function()
                        local bufs = {}
                        for _, win in ipairs(vim.api.nvim_list_wins()) do
                            bufs[vim.api.nvim_win_get_buf(win)] = true
                        end
                        return vim.tbl_keys(bufs)
                    end
                }
            },
            {name = "path"},
            {
                name = "look",
                keyword_length = 5,
                option = {convert_case = true, loud = true}
            }
        }
    }

    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(
        "/",
        {
            sources = {
                {name = "buffer"}
            }
        }
    )

    cmp.setup.cmdline(
        ":",
        {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources(
                {
                    {name = "path"}
                },
                {
                    {name = "cmdline", keyword_length = 3}
                }
            )
        }
    )

    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({map_char = {tex = ""}}))
end
