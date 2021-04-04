--  [ Marko Cerovac | NeoVim | autopairs settings ]
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

require('nvim-autopairs').setup({
--    local pairs_map = {
--        ["'"] = "'",
--        ['"'] = '"',
--        ['('] = ')',
--        ['['] = ']',
--        ['{'] = '}',
--        ['`'] = '`',
--    }
--    local disable_filetype = { "TelescopePrompt" }
--    local break_line_filetype = nil -- mean all file type
--    local html_break_line_filetype = {'html' , 'vue' , 'typescriptreact' , 'svelte' , 'javascriptreact'}
--    local ignored_next_char = "%w"
})

-- Add bracket expanding after pressing <CR>
local npairs = require('nvim-autopairs')

-- skip it, if you use another global object
_G.MUtils= {}

vim.g.completion_confirm_key = ""
MUtils.completion_confirm=function()
  if vim.fn.pumvisible() ~= 0  then
    if vim.fn.complete_info()["selected"] ~= -1 then
      vim.fn["compe#confirm"]()
      return npairs.esc("<c-y>")
    else
      vim.defer_fn(function()
        vim.fn["compe#confirm"]("<cr>")
      end, 20)
      return npairs.esc("<c-n>")
    end
  else
    return npairs.check_break_line_char()
  end
end
