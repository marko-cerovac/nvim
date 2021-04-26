--        ___           ___
--       /\  \         /\__\       Marko Cerovac
--      |::\  \       /:/  /       marko.cerovac16@gmail.com
--      |:|:\  \     /:/  /        https://github.com/marko-cerovac
--    __|:|\:\  \   /:/  /  ___
--   /::::|_\:\__\ /:/__/  /\__\
--   \:\~~\  \/__/ \:\  \ /:/  /
--    \:\  \        \:\  /:/  /    Group: NeoVim
--     \:\  \        \:\/:/  /     Origin: github.com/marko-cerovac/mc-neovim
--      \:\__\        \::/  /      File: plugins/autopairs.lua
--       \/__/         \/__/       Desc: autopairs settings


local Rule = require('nvim-autopairs.rule')
local npairs = require("nvim-autopairs")

npairs.setup({
    check_ts = true,
    ts_config = {
        lua = {'string'},-- it will not add pair on that treesitter node
        javascript = {'template_string'},
        java = false,-- don't check treesitter on java
    }
})

require('nvim-treesitter.configs').setup {
    autopairs = {enable = true}
}

local ts_conds = require('nvim-autopairs.ts-conds')


-- press % => %% is only inside comment or string
npairs.add_rules({
  Rule("%", "%", "lua")
    :with_pair(ts_conds.is_ts_node({'string','comment'})),
  Rule("$", "$", "lua")
    :with_pair(ts_conds.is_not_ts_node({'function'}))
})
