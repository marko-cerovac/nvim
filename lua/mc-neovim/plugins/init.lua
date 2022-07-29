-- Automatically install packer.nvim
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = vim.fn.system {
		"git clone https://github.com/wbthomason/packer.nvim ",
		install_path
	}
	vim.notify "Installing packer.nvim."
	vim.api.nvim_command "packadd packer.nvim"
end

-- Reload packer after sourcing this file
 vim.cmd [[
 	augroup packer_user_config
 	  autocmd!
 	  autocmd BufWritePost init.lua source <afile> | PackerSync
 	augroup end
]]

local packer = require("packer")

packer.init({
	display = {
		prompt_border = vim.g.border_style,
	}
})

return packer.startup(
    function(use)

		use "wbthomason/packer.nvim"

		-- Treesitter
		use {
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
            config = function ()
                require "mc-neovim.plugins.treesitter"
            end
		}

		-- Language Server Protocol
        use {
            "neovim/nvim-lspconfig",
			-- after = "nvim-lsp-installer",
			-- ft = lspFiletypes;
            config = function()
                require "mc-neovim.lsp.lsp-config"
            end
        }

		-- Language server installer
		use {
			"williamboman/mason.nvim",
			config = function()
				require("mason").setup({
					ui = {
						border = vim.g.border_style
					}
				})
			end
		}

		use {
			"williamboman/mason-lspconfig.nvim",
			config = function ()
				require("mason-lspconfig").setup()
			end
		}

		-- Completion engine
		use {
			"hrsh7th/nvim-cmp",
			requires = {
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-nvim-lsp-signature-help",
				"hrsh7th/cmp-nvim-lsp-document-symbol",
				"hrsh7th/cmp-cmdline",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-calc",
				"L3MON4D3/LuaSnip",
				"saadparwaiz1/cmp_luasnip"
			},
			config = function()
				require "mc-neovim.lsp.completion"
			end,
		}

		-- Lsp UI
		use {
			"glepnir/lspsaga.nvim",
			branch = "main",
			after = "nvim-lspconfig",
            config = function()
                require "mc-neovim.lsp.lspsaga"
            end
		}

		-- Lsp Diagnostics
		use {
			"folke/lsp-trouble.nvim",
			cmd = "Trouble",
			--[[ keys = {
				"<leader>cd",
				"gr"
			}, ]]
			requires = "kyazdani42/nvim-web-devicons",
            config = function ()
				require("trouble").setup {}
				vim.keymap.set(
					'n',
					"gr",
					"<cmd>TroubleToggle lsp_references<CR>",
					{ silent = true }
				)
            end
		}

		-- Rust tools
		--[[ use {
			"simrat39/rust-tools.nvim",
			ft = "rust",
			requires = "nvim-lspconfig",
			config = function ()
				require("rust-tools").setup()
			end
		} ]]

		-- Nvim-jdtls
		--[[ use {
			'mfussenegger/nvim-jdtls',
			ft = "java",
			config = function ()
				require "mc-neovim.lsp.java-jdtls"
			end
		} ]]

		-- Debugg adapter protocol
		use {
			"mfussenegger/nvim-dap",
			keys = { "<leader>d" },
			config = function ()
				require "mc-neovim.debugger.dap-config"
			end
		}
		-- Debugg adapter ui
		use {
			"rcarriga/nvim-dap-ui",
			after = "nvim-dap",
			config = function ()
				require "mc-neovim.debugger.dap-ui"
			end
		}
		use {
			"theHamsta/nvim-dap-virtual-text",
			after = "nvim-dap",
			config = function ()
				require "mc-neovim.debugger.dap-virtual-text"
			end
		}

		-- Status line
		use {
			"nvim-lualine/lualine.nvim",
			requires = "kyazdani42/nvim-web-devicons",
            config = function ()
                require "mc-neovim.plugins.lualine"
            end
		}

		-- Buffer line
		use {
			"akinsho/bufferline.nvim",
			requires = "kyazdani42/nvim-web-devicons",
			opt = true,
			event = "WinNew",
			config = function ()
				require "mc-neovim.plugins.bufferline"
			end
		}

		-- Colorschemes
		use {
			"marko-cerovac/material.nvim",
			config = function ()
				require "mc-neovim.colorschemes.material"
			end
		}
		use {
			"folke/tokyonight.nvim",
			event = "ColorSchemePre",
			config = function ()
				require "mc-neovim.colorschemes.tokyonight"
			end
		}
		use {
			"shaunsingh/nord.nvim",
			event = "ColorSchemePre",
			config = function ()
				require "mc-neovim.colorschemes.nord"
			end
		}
		use {
			"rose-pine/neovim",
			event = "ColorSchemePre",
			config = function ()
				require "mc-neovim.colorschemes.rose-pine"
			end
		}
		--[[ use {
			"navarasu/onedark.nvim",
			event = "ColorSchemePre",
			config = function ()
				require "mc-neovim.colorschemes.onedark"
			end
		} ]]

		-- Autopairs
        use {
            "windwp/nvim-autopairs",
			event = "InsertEnter",
            config = function()
				require("nvim-autopairs").setup({ check_ts = true })
				require("nvim-treesitter.configs").setup { autopairs = {enable = true} }
            end,
        }

		-- Which key
		use {
			"folke/which-key.nvim",
			config = function()
				require "mc-neovim.plugins.whichkey"
			end
		}

		-- File tree explorer
        use {
			"kyazdani42/nvim-tree.lua",
            -- cmd = "NvimTreeToggle",
			keys = { "<leader>e" },
            config = function()
                require "mc-neovim.plugins.nvim-tree"
            end
        }

		-- Telescope
        use {
            "nvim-telescope/telescope.nvim",
			keys = {
				"<leader>f",
				"<leader>g",
			},
			requires = { "nvim-lua/plenary.nvim" },
            config = function()
                require "mc-neovim.plugins.telescope"
            end
        }
		use {
			"nvim-telescope/telescope-fzy-native.nvim",
			after = "telescope.nvim",
            config = function()
				require("telescope").load_extension("fzy_native")
            end
		}
		use {
			"nvim-telescope/telescope-file-browser.nvim",
			after = "telescope.nvim",
            config = function()
				require("telescope").load_extension("file_browser")
            end
		}


		-- Git signs
        use {
            "lewis6991/gitsigns.nvim",
            event = "BufRead",
			requires = { "nvim-lua/plenary.nvim", },
            config = function()
                require "mc-neovim.plugins.gitsigns"
            end
        }

		-- Git UI
		use {
			"TimUntersberger/neogit",
			requires = { "nvim-lua/plenary.nvim" },
			cmd = "Neogit",
            config = function()
				require("neogit").setup{}
            end
		}

		-- Startscreen
        use {
            "glepnir/dashboard-nvim",
            config = function()
                require "mc-neovim.plugins.dashboard"
            end
        }

		-- Indent line
        use {
            "lukas-reineke/indent-blankline.nvim",
			cmd = "IndentBlanklineToggle",
			-- keys = { "<leader>si" },
			-- ft = lspFiletypes;
            config = function()
                require "mc-neovim.plugins.indent-blankline"
            end
        }

		-- Commenting
		use {
			"b3nj5m1n/kommentary",
			keys = { "<leader>k" },
			setup = function ()
				-- Disable kommentary mappings
				vim.g.kommentary_create_default_mappings = false
			end,
			config = function()
				require("kommentary.config").configure_language(
					"default",
					{
						-- prefer_single_line_comments = true,
					}
				)
				vim.keymap.set(
					'n',
					"<leader>k",
					"<Plug>kommentary_line_default",
					{}
				)
				vim.keymap.set(
					'x',
					"<leader>k",
					"<Plug>kommentary_visual_default",
					{}
				)
			end
		}

		-- Colorizer
		use {
			"norcalli/nvim-colorizer.lua",
			-- cmd = { "ColorizerToggle" },
			keys = { "<leader>sz" },
            config = function ()
				require("colorizer").setup({
					names = false;
				})
			vim.keymap.set(
				'n',
				"<leader>sz",
				":ColorizerToggle<CR>",
				{ silent = true }
			)

            end
		}

		-- Org mode
		use {
			"nvim-neorg/neorg",
			ft = "norg",
			requires = {
				"nvim-lua/plenary.nvim",
				"hrsh7th/nvim-cmp",
			},
            config = function ()
                require "mc-neovim.plugins.neorg"
            end
		}
	end)
