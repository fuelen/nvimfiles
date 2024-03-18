return require("packer").startup(
    function()
        -- packer can manage itself
        use "wbthomason/packer.nvim"

        -- color Scheme
        use {
            "EdenEast/nightfox.nvim",
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
            "kyazdani42/nvim-tree.lua",
            config = require "plugins.nvim-tree",
            -- https://github.com/kyazdani42/nvim-tree.lua/issues/991
            commit = "3f4ed9b6c2598ab8304186486a05ae7a328b8d49",
            requires = {
                "kyazdani42/nvim-web-devicons"
            }
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
        use {"nvim-treesitter/playground"}

        -- prints vertical lines at each indentation level
        use {"lukas-reineke/indent-blankline.nvim", config = require "plugins.indent-blankline"}

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

        -- collection of common configurations for built-in language server client
        use {
            "neovim/nvim-lspconfig",
            config = require "plugins.lspconfig"
        }

        -- autocomplete with plugins
        use {
            "hrsh7th/nvim-cmp",
            -- https://github.com/hrsh7th/nvim-cmp/commit/a0225043ab823fcad8d0d802e276d9838fb48c30
            -- the commit above produces errors like:
            -- Error executing luv callback:
            -- ...nvim/site/pack/packer/start/nvim-cmp/lua/cmp/context.lua:46: E5560: nvim_buf_get_option must not be called in a lua loop callback
            -- stack traceback:
            -- 	[C]: in function 'nvim_buf_get_option'
            -- 	...nvim/site/pack/packer/start/nvim-cmp/lua/cmp/context.lua:46: in function 'new'
            -- 	...re/nvim/site/pack/packer/start/nvim-cmp/lua/cmp/core.lua:278: in function 'callback'
            -- 	.../nvim/site/pack/packer/start/nvim-cmp/lua/cmp/source.lua:369: in function 'callback'
            -- 	.../site/pack/packer/start/nvim-cmp/lua/cmp/utils/async.lua:131: in function 'callback'
            -- 	...im/site/pack/packer/start/cmp-look/lua/cmp_look/init.lua:184: in function <...im/site/pack/packer/start/cmp-look/lua/cmp_look/init.lua:174>
            --
            -- So, we rollback just to random commit in the past to have working autocomplete.

            commit = "bd168a2f86f01f2a348e5f4ac2980943737ff459",
            config = require "plugins.cmp",
            requires = {
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-cmdline",
                -- cmp-look requires "words" package (arch linux)
                "octaltree/cmp-look",
                -- snippets
                "SirVer/ultisnips",
                "quangnguyen30192/cmp-nvim-ultisnips"
            }
        }

        --  highly extendable fuzzy finder over lists
        use {
            "nvim-telescope/telescope.nvim",
            config = require "plugins.telescope",
            requires = {
                {"nvim-lua/popup.nvim"},
                {"nvim-lua/plenary.nvim"}
            }
        }
        -- better sorter for telescope
        use {
            "nvim-telescope/telescope-fzf-native.nvim",
            run = "make",
            config = require "plugins.telescope-fzf-native"
        }

        -- Fancy startup screen
        use {
            "mhinz/vim-startify",
            config = require "plugins.startify"
        }

        -- grep, perhaps I'll replace it by telescope. Some day
        use {
            "dkprice/vim-easygrep",
            config = require "plugins.easygrep"
        }

        -- better design for quick-fix window, it is used in easygrep, vim-fugitive, etc
        use "kevinhwang91/nvim-bqf"

        -- A helper which shows key-bindings
        use {
            "folke/which-key.nvim",
            config = require "plugins.which-key"
        }

        -- Show an icon in autocompletion list
        use {
            "onsails/lspkind-nvim",
            config = require "plugins.lspkind"
        }

        -- Show signature from LSP when apply a function
        use {
            "ray-x/lsp_signature.nvim",
            config = require "plugins.lsp_signature"
        }

        -- Idirs 2 support
        use "edwinb/idris2-vim"

        -- images viewer
        use {
            "samodostal/image.nvim",
            requires = {
                "nvim-lua/plenary.nvim",
                "m00qek/baleia.nvim"
            },
            config = require "plugins.image"
        }

        -- running tests
        use {
            "nvim-neotest/neotest",
            requires = {
                "nvim-lua/plenary.nvim",
                "nvim-treesitter/nvim-treesitter",
                "antoinemadec/FixCursorHold.nvim",
                "jfpedroza/neotest-elixir"
            },
            config = require "plugins.neotest"
        }

        use {"sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim"}

        use {
            "akinsho/git-conflict.nvim",
            tag = "*",
            config = require "plugins.git-conflict"
        }

        use {
            "nvim-lualine/lualine.nvim",
            requires = {"nvim-tree/nvim-web-devicons", opt = true},
            config = require "plugins.lualine"
        }

        use {
            "folke/todo-comments.nvim",
            requires = "nvim-lua/plenary.nvim",
            config = require "plugins.todo-comments"
        }
    end
)
