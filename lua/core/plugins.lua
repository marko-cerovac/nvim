local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

-- Ensure packer is installed
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.api.nvim_command('!git clone https://github.com/wbthomason/packer.nvim '.. install_path)
  vim.api.nvim_command 'packadd packer.nvim'
end

-- Filetypes for which lsp should be added
local lspFiletypes = {
	'lua',
	'c',
	'cpp',
	'make',
	'cmake',
	'bash',
	'zsh',
	'sh',
}

local packer = require 'packer'

return packer.startup(
    function(use)

		use 'wbthomason/packer.nvim'

		use {
			'marko-cerovac/material.nvim',
			config = function ()
				require 'colorschemes.material'
			end
		}

		use {
			'folke/tokyonight.nvim',
			-- opt = true,
			keys = { '<leader>ft' },
			config = function ()
				require 'colorschemes.tokyonight'
			end
		}

		use {
			'nvim-treesitter/nvim-treesitter',
			run = ':TSUpdate',
            config = function ()
                require 'plugins.treesitter'
            end
		}

		-- Language Server Protocol
        use {
            'neovim/nvim-lspconfig',
			-- after = 'nvim-cmp',
			ft = lspFiletypes;
            config = function()
                require 'lsp.lsp-config'
            end
        }

		-- Language server installer
        use {
            'kabouzeid/nvim-lspinstall',
			opt = true,
			after = 'nvim-lspconfig',
            config = function()
                require 'lsp.lsp-install'
            end
        }

		-- Completion engine
		use {
			'hrsh7th/nvim-cmp',
			requires = {
				'hrsh7th/cmp-nvim-lsp',
				'hrsh7th/cmp-buffer',
				'hrsh7th/cmp-nvim-lua',
				'hrsh7th/cmp-path',
				'hrsh7th/cmp-calc',
				'L3MON4D3/LuaSnip',
				'saadparwaiz1/cmp_luasnip'
			},
			config = function()
				require 'lsp.completion'
				require 'lsp.snippets'
			end,
		}

		-- Lsp UI
		use {
			'tami5/lspsaga.nvim',
			opt = true,
			after = 'nvim-lspconfig',
            config = function()
                require 'lsp.lspsaga'
            end
		}

		-- Lsp Diagnostics
		use {
			'folke/lsp-trouble.nvim',
			keys = { '<leader>cd' },
			-- after = 'nvim-lspconfig',
			requires = 'kyazdani42/nvim-web-devicons',
            config = function ()
                require 'lsp.lsptrouble'
            end
		}

		-- Debugg adapter protocol
		use {
			'mfussenegger/nvim-dap',
			keys = { '<leader>d' },
			config = function ()
				require('debugger.dap-config')
			end
		}
		-- Debugg adapter ui
		use {
			'rcarriga/nvim-dap-ui',
			after = 'nvim-dap',
			config = function ()
				require('debugger.dap-ui')
			end
		}
		use {
			'theHamsta/nvim-dap-virtual-text',
			after = 'nvim-dap',
			config = function ()
				require('debugger.dap-virtual-text')
			end
		}

		-- Autopairs
        use {
            'windwp/nvim-autopairs',
			event = 'InsertEnter',
            config = function()
                require 'plugins.autopairs'
            end,
        }

		-- Status line
		use {
			'hoob3rt/lualine.nvim',
			requires = 'kyazdani42/nvim-web-devicons',
            event = 'BufWinEnter',
            -- event = 'BufRead',
            config = function ()
                require 'plugins.lualine'
            end
		}

		-- Buffer line
		use {
			'akinsho/bufferline.nvim',
			requires = 'kyazdani42/nvim-web-devicons',
			opt = true,
			keys = { '<leader>sb' },
			-- event = 'BufAdd',
			config = function ()
				require 'plugins.bufferline'
			end
		}

		-- Which key
		use {
			'folke/which-key.nvim',
			config = function()
				require'plugins.whichkey'
			end
		}

		-- File tree explorer
        use {
			'kyazdani42/nvim-tree.lua',
			-- event = 'VimEnter',
            cmd = 'NvimTreeToggle',
            config = function()
                require 'plugins.nvim-tree'
            end
        }

		-- Telescope
        use {
            'nvim-telescope/telescope.nvim',
			keys = {
				'<leader>f',
				'<leader>g',
			},
			requires = {
				{'nvim-lua/popup.nvim', opt = true},
				{'nvim-lua/plenary.nvim'},
			},
            config = function()
                require 'plugins.telescope'
            end
        }
		use {
			'nvim-telescope/telescope-fzy-native.nvim',
			after = 'telescope.nvim',
            config = function()
				require('telescope').load_extension('fzy_native')
            end
		}

		-- Git signs
        use {
            'lewis6991/gitsigns.nvim',
            event = 'BufRead',
			requires = { 'nvim-lua/plenary.nvim', },
            config = function()
                require 'plugins.gitsigns'
            end
        }

		-- Git UI
		use {
			'TimUntersberger/neogit',
			requires = {'nvim-lua/plenary.nvim'},
			cmd = 'Neogit',
            config = function()
                require 'plugins.neogit'
            end
		}

		-- Startscreen
        use {
            'glepnir/dashboard-nvim',
            -- event = 'UIEnter',
            setup = function()
                require 'plugins.dashboard'
            end
        }

		-- Indent line
        use {
            'lukas-reineke/indent-blankline.nvim',
			keys = { '<leader>si' },
            config = function()
                require'plugins.indent-blankline'
            end
        }

		-- Commenting
		use {
			'b3nj5m1n/kommentary',
			keys = { '<leader>k' },
			-- event = 'BufRead',
			setup = function ()
				-- Disable kommentary mappings
				vim.g.kommentary_create_default_mappings = false
			end,
			config = function()
				require'plugins.kommentary'
			end
		}

		-- Colorizer
		use {
			'norcalli/nvim-colorizer.lua',
			cmd = {
                'ColorizerAttachToBuffer',
                'ColorizerToggle'
            },
            config = function ()
				require('colorizer').setup({
					names = false;
				})
            end
		}

		-- Org mode
		use {
			'vhyrro/neorg',
			ft = 'norg',
			requires = {
				'nvim-lua/plenary.nvim',
				'hrsh7th/nvim-cmp',
			},
            config = function ()
                require'plugins.neorg'
            end
		}
	end)
