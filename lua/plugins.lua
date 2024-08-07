return require("packer").startup(function()
    -- packer can manage itself
    use("wbthomason/packer.nvim")

    -- color Scheme
    use({
        "EdenEast/nightfox.nvim",
        config = require("plugins.colorscheme"),
        as = "colorscheme",
    })
    -- changes cursor highlighting during search
    use("airblade/vim-current-search-match")

    -- highlight other uses of the current word under the cursor
    use({
        "RRethy/vim-illuminate",
        config = require("plugins.illuminate"),
    })

    -- display colors in file
    use({
        "rrethy/vim-hexokinase",
        config = require("plugins.hexokinase"),
        run = "make hexokinase",
    })

    use({
        "bkad/CamelCaseMotion",
        config = require("plugins.camel_case_motion"),
    })

    -- file browser
    use({
        "kyazdani42/nvim-tree.lua",
        config = require("plugins.nvim-tree"),
        -- https://github.com/kyazdani42/nvim-tree.lua/issues/991
        commit = "3f4ed9b6c2598ab8304186486a05ae7a328b8d49",
        requires = {
            "kyazdani42/nvim-web-devicons",
        },
    })

    -- autoclose parentheses
    use({
        "windwp/nvim-autopairs",
        config = require("plugins.autopairs"),
    })

    -- language-agnostic comment/uncomment functionality
    use({
        "tomtom/tcomment_vim",
        config = require("plugins.tcomment"),
    })

    -- support direnv utility
    use("direnv/direnv.vim")

    -- a set of configs for treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        config = require("plugins.treesitter"),
        run = ":TSUpdate",
    })

    -- prints vertical lines at each indentation level
    use({ "lukas-reineke/indent-blankline.nvim", config = require("plugins.indent-blankline") })

    -- open files in file:line_number format from CLI, useful with `neovim-remote` tool
    use("wsdjeg/vim-fetch")

    -- for manipulation with parentheses, brackets, quotes
    use("tpope/vim-surround")

    -- multiple cursors
    use("mg979/vim-visual-multi")

    -- switch between opposite terms
    use({
        "AndrewRadev/switch.vim",
        config = require("plugins.switch"),
    })

    -- translate human languages
    use({
        "voldikss/vim-translator",
        config = require("plugins.translator"),
    })

    -- shows a git diff in the sign column
    use({
        "lewis6991/gitsigns.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
        config = require("plugins.gitsigns"),
    })

    -- show git blame in cursor line
    use({
        "f-person/git-blame.nvim",
        config = require("plugins.git-blame"),
    })

    -- plugin for git
    use("tpope/vim-fugitive")

    -- collection of common configurations for built-in language server client
    use({
        "neovim/nvim-lspconfig",
        config = require("plugins.lspconfig"),
    })

    -- snippets for nvim-cmp
    use({
        "L3MON4D3/LuaSnip",
        config = require("plugins.luasnip"),
        tag = "v2.3.0",
        run = "make install_jsregexp",
        requires = {
            "rafamadriz/friendly-snippets",
        },
    })

    -- autocomplete with plugins
    use({
        "hrsh7th/nvim-cmp",
        config = require("plugins.cmp"),
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
            -- cmp-look requires "words" package (arch linux)
            "octaltree/cmp-look",
        },
    })

    --  highly extendable fuzzy finder over lists
    use({
        "nvim-telescope/telescope.nvim",
        config = require("plugins.telescope"),
        requires = {
            { "nvim-lua/popup.nvim" },
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-ui-select.nvim" },
        },
    })
    -- better sorter for telescope
    use({
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
        config = require("plugins.telescope-fzf-native"),
    })

    -- Fancy startup screen
    use({
        "mhinz/vim-startify",
        config = require("plugins.startify"),
    })

    -- grep, perhaps I'll replace it by telescope. Some day
    use({
        "dkprice/vim-easygrep",
        config = require("plugins.easygrep"),
    })

    -- better design for quick-fix window, it is used in easygrep, vim-fugitive, etc
    use("kevinhwang91/nvim-bqf")

    -- A helper which shows key-bindings
    use({
        "folke/which-key.nvim",
        config = require("plugins.which-key"),
    })

    -- Show an icon in autocompletion list
    use({
        "onsails/lspkind-nvim",
        config = require("plugins.lspkind"),
    })

    -- Show signature from LSP when apply a function
    use({
        "ray-x/lsp_signature.nvim",
        config = require("plugins.lsp_signature"),
    })

    -- Idirs 2 support
    use("edwinb/idris2-vim")

    -- images viewer
    use({
        "samodostal/image.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "m00qek/baleia.nvim",
        },
        config = require("plugins.image"),
    })

    -- running tests
    use({
        "nvim-neotest/neotest",
        requires = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            "jfpedroza/neotest-elixir",
        },
        config = require("plugins.neotest"),
    })

    use({
        "sindrets/diffview.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = require("plugins.diffview"),
    })

    use({
        "akinsho/git-conflict.nvim",
        tag = "*",
        config = require("plugins.git-conflict"),
    })

    use({
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-tree/nvim-web-devicons", opt = true },
        config = require("plugins.lualine"),
    })

    use({
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = require("plugins.todo-comments"),
    })
    use({
        "nvim-treesitter/nvim-treesitter-context",
        config = require("plugins.treesitter-context"),
    })
    -- find and replace plugin
    use({
        "MagicDuck/grug-far.nvim",
        config = function()
            require("grug-far").setup({})
        end,
    })
    use("nanotee/sqls.nvim")

    -- notifications and LSP progress messages
    use({
        "j-hui/fidget.nvim",
        config = require("plugins.fidget"),
    })

    -- enhance LSP code actions
    use({
        "luckasRanarison/clear-action.nvim",
        config = require("plugins.clear-actions"),
    })

    use({
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = require("plugins.copilot"),
    })
    use({
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua" },
        config = require("plugins.copilot_cmp"),
    })

    -- format code, doesn't require language server
    use({
        "stevearc/conform.nvim",
        config = require("plugins.conform"),
    })
end)
