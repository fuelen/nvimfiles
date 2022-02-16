return function()
  require('lspkind').init({
    mode = 'symbol_text',
    symbol_map = {
      Text = '',
      Method = 'ƒ',
      Function = 'ƒ',
      Constructor = '',
      Variable = '',
      Class = '',
      Interface = 'ﰮ',
      Module = '',
      Property = '',
      Unit = '',
      Value = '',
      Enum = '了',
      Keyword = '',
      Snippet = '﬌',
      Color = '',
      File = '',
      Folder = '',
      EnumMember = '',
      Constant = '',
      Struct = ''
    },
})
end
