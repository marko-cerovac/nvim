--  [ Marko Cerovac | NeoVim | plugins ]
--         ___           ___
--        /\  \         /\__\
--       |::\  \       /:/  /
--       |:|:\  \     /:/  /
--     __|:|\:\  \   /:/  /  ___
--    /::::|_\:\__\ /:/__/  /\__\
--    \:\~~\  \/__/ \:\  \ /:/  /
--     \:\  \        \:\  /:/  /
--      \:\  \        \:\/:/  /
--       \:\__\        \::/  /
--        \/__/         \/__/
--

local execute = vim.api.nvim_command
local fn = vim.fn

--local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

return require('packer').startup(function (use)
    --Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    --File explorer
    use 'kyazdani42/nvim-tree.lua'

    --Lsp
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-compe'
    use 'glepnir/lspsaga.nvim'
    use 'onsails/lspkind-nvim'

    --Snippets
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'
    --use 'norcalli/snippets.nvim'

    --TreeSitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    --Icons
    use 'kyazdani42/nvim-web-devicons'

    --Colorizer
    use 'norcalli/nvim-colorizer.lua'

    --Color themes
    use {
        'marko-cerovac/material.nvim',
        requires = 'tjdevries/colorbuddy.nvim'
    }

    --Status line
    use 'glepnir/galaxyline.nvim'

    --Buffer line
    use {
        'akinsho/nvim-bufferline.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }

    --Git
    use {
        'lewis6991/gitsigns.nvim',
        requires = 'nvim-lua/plenary.nvim'
    }

    --Auto pairs
    use 'windwp/nvim-autopairs'

    --Commenter
    use 'b3nj5m1n/kommentary'

    --Code lines
    use {
        'lukas-reineke/indent-blankline.nvim',
        branch = 'lua'
    }

    --Telscope
    use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use 'nvim-telescope/telescope-fzy-native.nvim'

    --Start screen
    --use 'mhinz/vim-startify'

    --Which key
    --use 'liuchengxu/vim-which-key'

end)
