return require("packer").startup(
    function()
        -- packer can manage itself
        use "wbthomason/packer.nvim"

        -- color Scheme
        use {
            "KeitaNakamura/neodark.vim",
            config = require "plugins.colorscheme",
            as = "colorscheme"
        }
        -- changes cursor highlighting during search
        use "airblade/vim-current-search-match"

        -- highlight other uses of the current word under the cursor
        use {
            "RRethy/vim-illuminate",
            config = require "plugins.illuminate"
        }

        -- display colors in file
        use {
            "rrethy/vim-hexokinase",
            config = require "plugins.hexokinase",
            run = "make hexokinase"
        }

        use {
            "bkad/CamelCaseMotion",
            config = require "plugins.camel_case_motion"
        }

        -- file browser
        use {
            "scrooloose/nerdtree",
            config = require "plugins.nerdtree"
        }
        use "Xuyuanp/nerdtree-git-plugin"

        use {
            "hrsh7th/nvim-compe",
            config = require "plugins.compe"
        }

        -- autoclose parentheses
        use {
            "windwp/nvim-autopairs",
            config = require "plugins.autopairs"
        }

        use {
            "vim-autoformat/vim-autoformat",
            config = require "plugins.autoformat"
        }

        -- language-agnostic comment/uncomment functionality
        use {
            "tomtom/tcomment_vim",
            config = require "plugins.tcomment"
        }

        -- support direnv utility
        use "direnv/direnv.vim"

        -- a set of configs for treesitter
        use {
            "nvim-treesitter/nvim-treesitter",
            config = require "plugins.treesitter",
            run = ":TSUpdate"
        }

        -- a tool for debugging treesitter
        use {"nvim-treesitter/playground", after = "nvim-treesitter"}

        -- prints vertical lines at each indentation level. requires treesitter
        use {
            "lukas-reineke/indent-blankline.nvim",
            config = require "plugins.indent-blankline",
            after = "nvim-treesitter"
        }

        -- open files in file:line_number format from CLI, useful with `neovim-remote` tool
        use "wsdjeg/vim-fetch"

        -- for manipulation with parentheses, brackets, quotes
        use "tpope/vim-surround"

        -- multiple cursors
        use "mg979/vim-visual-multi"

        -- switch between opposite terms
        use {
            "AndrewRadev/switch.vim",
            config = require "plugins.switch"
        }

        -- translate human languages
        use {
            "voldikss/vim-translator",
            config = require "plugins.translator"
        }

        -- shows a git diff in the sign column
        use {
            "lewis6991/gitsigns.nvim",
            requires = {
                "nvim-lua/plenary.nvim"
            },
            config = require "plugins.gitsigns"
        }

        -- show git blame in cursor line
        use {
            "f-person/git-blame.nvim",
            config = require "plugins.git-blame"
        }

        -- plugin for git
        use "tpope/vim-fugitive"

        --  collection of common configurations for built-in language server client
        use {
            "neovim/nvim-lspconfig",
            config = require "plugins.lspconfig"
        }

        -- can be removed in the future when elixir plugin for treesitter is improved
        use "elixir-editors/vim-elixir"

        --  highly extendable fuzzy finder over lists
        use {
            "nvim-telescope/telescope.nvim",
            config = require "plugins.telescope",
            requires = {
                {"nvim-lua/popup.nvim"},
                {"nvim-lua/plenary.nvim"}
            }
        }
        use "rhysd/vim-gfm-syntax"
    end
)