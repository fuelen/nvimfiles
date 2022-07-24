return function()
    local npairs = require("nvim-autopairs")
    local Rule = require('nvim-autopairs.rule')
    npairs.setup()

    local endwise = require("nvim-autopairs.ts-rule").endwise
    npairs.add_rules(
        {
            endwise('then$', 'end', 'lua', nil),
        }
    )
    npairs.add_rules(require('nvim-autopairs.rules.endwise-elixir'))
end
