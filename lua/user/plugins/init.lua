-- load packer
local packer = require "user.util.packer_init"

return packer.startup(function(use)
    use "wbthomason/packer.nvim"

    -- use precompiled cache
    use {
        "lewis6991/impatient.nvim",
        rocks = "mpack",
    }

    -- treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter-textobjects",
        run = ":TSUpdate",
        config = function()
            require "user.plugins.treesitter"
        end,
    }

    -- telescope
    use {
        {
            "nvim-telescope/telescope-file-browser.nvim",
            requires = "kyazdani42/nvim-web-devicons",
        },
        {
            "nvim-telescope/telescope-ui-select.nvim"
        },
        {
            "nvim-telescope/telescope.nvim",
            requires = {
                { "nvim-lua/plenary.nvim" },
                {
                    "nvim-telescope/telescope-fzy-native.nvim",
                    run = "make",
                },
            },
            config = function()
                require "user.plugins.telescope"
            end,
        }
    }

    -- language server installer
    use {
        {
            "williamboman/mason.nvim",
            -- cmd = "LspStart",
            config = function()
                require("mason").setup { ui = { border = vim.g.border_style } }
            end
        },
        {
            "williamboman/mason-lspconfig.nvim",
            config = function()
                require("mason-lspconfig").setup()
            end,
            after = "mason.nvim"
        }
    }

    -- language server protocol
    use {
        "neovim/nvim-lspconfig",
        after = "mason.nvim",
        config = function()
            -- require "user.lsp.config"
            require "user.lsp.servers"
        end,
    }

    -- snippet engine
    use {
        "L3MON4D3/LuaSnip",
		event = {
			"InsertEnter",
			"CmdlineEnter",
		},
        config = function()
            require "user.lsp.snippets"
        end,
    }

    -- completion engine
    use {
		{
			"hrsh7th/nvim-cmp",
			after = "LuaSnip",
			requires = "L3MON4D3/LuaSnip",
			config = function()
				require "user.lsp.completion"
			end,
		},
		{ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
		{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
		{ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
		{ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
		{ "hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp" },
		{ "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
		{ "hrsh7th/cmp-path", after = "nvim-cmp" },
    }

    -- debugg adapter protocol
    use {
        "mfussenegger/nvim-dap",
        keys = {
            "<Leader>dd",
            "<Leader>b",
            "<M-;>",
        },
        config = function()
            require "user.debugger.config"
        end,
    }

    -- debugg adapter ui
    use {
        "rcarriga/nvim-dap-ui",
        after = "nvim-dap",
        config = function()
            require "user.debugger.ui"
        end,
    }

    -- colorscheme
    use {
        "marko-cerovac/material.nvim",
        config = function()
            require "user.themes.material"
        end,
    }
    --[[ use {
        "folke/tokyonight.nvim",
        config = function()
            require "user.themes.tokyonight"
        end,
    } ]]

    -- status line
    use {
        "nvim-lualine/lualine.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require "user.plugins.lualine"
        end,
    }

    -- git integration
    use {
        "lewis6991/gitsigns.nvim",
        config = function()
            require "user.plugins.gitsigns"
        end,
    }

    -- autopairs
    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup { check_ts = true }
            require("nvim-treesitter.configs").setup { autopairs = { enable = true } }
        end,
    }

    -- git ui
    use {
        "TimUntersberger/neogit",
        requires = "nvim-lua/plenary.nvim",
        cmd = "Neogit",
        config = function()
            require("neogit").setup {}
        end,
    }

    -- indent line
    use {
        "lukas-reineke/indent-blankline.nvim",
        cmd = "IndentBlanklineToggle",
        config = function()
            require "user.plugins.indentline"
        end,
    }

    -- commenting plugin
    use {
        "b3nj5m1n/kommentary",
        keys = {
            "<Leader>k",
            "<Leader>/",
        },
        setup = function()
            vim.g.kommentary_create_default_mappings = false
        end,
        config = function()
            require "user.plugins.kommentary"
        end,
    }

    -- colorizer
    use {
        "norcalli/nvim-colorizer.lua",
        cmd = "ColorizerToggle",
    }

    -- practice
    use {
        "ThePrimeagen/vim-be-good",
        cmd = "VimBeGood"
    }
end)
