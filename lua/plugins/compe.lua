return function()
  vim.o.completeopt = "menuone,noselect"

  -- START alias C-n to C-j and C-p to C-k
  local replace_termcodes = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end

  local check_back_space = function()
    local col = vim.fn.col(".") - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
  end

  _G.c_j_complete = function()
    if vim.fn.pumvisible() == 1 then
      return replace_termcodes "<C-n>"
    elseif vim.fn["vsnip#available"](1) == 1 then
      return replace_termcodes "<Plug>(vsnip-expand-or-jump)"
    elseif check_back_space() then
      return replace_termcodes "<C-j>"
    else
      return vim.fn["compe#complete"]()
    end
  end

  _G.c_k_complete = function()
    if vim.fn.pumvisible() == 1 then
      return replace_termcodes "<C-p>"
    elseif vim.fn["vsnip#jumpable"](-1) == 1 then
      return replace_termcodes "<Plug>(vsnip-jump-prev)"
    else
      -- If <S-Tab> is not working in your terminal, change it to <C-h>
      return replace_termcodes "<C-k>"
    end
  end

  vim.api.nvim_set_keymap("i", "<C-j>", "v:lua.c_j_complete()", {expr = true})
  vim.api.nvim_set_keymap("s", "<C-j>", "v:lua.c_j_complete()", {expr = true})
  vim.api.nvim_set_keymap("i", "<C-k>", "v:lua.c_k_complete()", {expr = true})
  vim.api.nvim_set_keymap("s", "<C-k>", "v:lua.c_k_complete()", {expr = true})
  -- END alias C-n to C-j and C-p to C-k

  vim.api.nvim_set_keymap(
    "i",
    "<C-Space>",
    [[compe#complete()]],
    {
      expr = true,
      silent = true
    }
  )

  vim.api.nvim_set_keymap(
    "i",
    "<C-e>",
    [[compe#close('<C-e>')]],
    {
      expr = true,
      silent = true
    }
  )

  vim.api.nvim_set_keymap(
    "i",
    "<space>",
    [[compe#confirm('<space>')]],
    {
      expr = true,
      silent = true
    }
  )

  vim.api.nvim_set_keymap(
    "i",
    "<C-f>",
    [[compe#scroll({ 'delta': +4 })]],
    {
      expr = true,
      silent = true
    }
  )

  vim.api.nvim_set_keymap(
    "i",
    "<C-d>",
    [[compe#scroll({ 'delta': -4 })]],
    {
      expr = true,
      silent = true
    }
  )
  require "compe".setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = "enable",
    throttle_time = 80,
    source_timeout = 200,
    resolve_timeout = 800,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = {
      border = {"", "", "", " ", "", "", "", " "}, -- the border option is the same as `|help nvim_open_win|`
      winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
      max_width = 120,
      min_width = 60,
      max_height = math.floor(vim.o.lines * 0.3),
      min_height = 1
    },
    source = {
      path = true,
      buffer = true,
      calc = true,
      nvim_lsp = true,
      nvim_lua = true,
      -- don't use VS code snippets
      vsnip = false,
      ultisnips = true,
      luasnip = true
    }
  }
end
