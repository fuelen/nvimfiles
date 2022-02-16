return function()
  vim.o.completeopt = "menuone,noselect"
  local lspkind = require('lspkind')
  local cmp = require('cmp')
  cmp.setup {
    snippet = {
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    formatting = {
      format = lspkind.cmp_format({
        mode = 'symbol', -- show only symbol annotations
        maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      })
    },
    mapping = {
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },

    sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    {
        name = 'look',
        keyword_length = 5,
        option = { convert_case = true, loud = true }
      }
    },
  }

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
    { name = 'buffer' }
    }
  })

  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
end
