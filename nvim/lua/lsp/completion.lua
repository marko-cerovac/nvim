--        ___           ___
--       /\  \         /\__\       Marko Cerovac
--      |::\  \       /:/  /       marko.cerovac16@gmail.com
--      |:|:\  \     /:/  /        https://github.com/marko-cerovac
--    __|:|\:\  \   /:/  /  ___
--   /::::|_\:\__\ /:/__/  /\__\
--   \:\~~\  \/__/ \:\  \ /:/  /
--    \:\  \        \:\  /:/  /    Group: NeoVim
--     \:\  \        \:\/:/  /     Origin: github.com/marko-cerovac/mc-neovim
--      \:\__\        \::/  /      File: lsp/completion.lua
--       \/__/         \/__/       Desc: lsp completion settings


vim.o.completeopt = "menuone,noselect"
local npairs = require('nvim-autopairs')

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  allow_prefix_unmatch = false;
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = false;

  source = {
    path = true;
    buffer = true;
    calc = true;
    vsnip = true;
    nvim_lsp = true;
    nvim_lua = true;
    spell = true;
    tags = false;
    treesitter = false;
    snippets_nvim = false;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Tab autocomplete function
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
   return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end

-- Shift + Tab autocomplete function
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

-- <CR> for autocomplete confirmation and autopairs expansion
vim.g.completion_confirm_key = ""
_G.completion_confirm=function()
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

-- Plugin: onsails/lspkind-nvim
require('lspkind').init({
    with_text = false,
    symbol_map = {
      Text = '  ',
      Method = '  ',
      Function = '  ',
      Constructor = '  ',
      Variable = '[]',
      Class = '  ',
      Interface = ' 蘒',
      Module = '  ',
      Property = '  ',
      Unit = ' 塞 ',
      Value = '  ',
      Enum = ' 練',
      Keyword = '  ',
      Snippet = '  ',
      Color = '',
      File = '',
      Folder = ' ﱮ ',
      EnumMember = '  ',
      Constant = '  ',
      Struct = '  '
    },
})

-- Set snippet directory
vim.g.vsnip_snippet_dir = "$HOME/.config/nvim/snippets"

-- Set Tab and Shift + Tab key mappings
vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", {silent = true, expr = true})
vim.api.nvim_set_keymap('i' , '<CR>','v:lua.completion_confirm()', {expr = true , noremap = true})
vim.api.nvim_set_keymap("i", "<C-e>", [[compe#close('<C-e>')]], {silent = true, expr = true})
vim.api.nvim_set_keymap("i", "<C-f>", [[compe#scroll({ 'delta': +4 })]], {silent = true, expr = true})
vim.api.nvim_set_keymap("i", "<C-d>", [[compe#scroll({ 'delta': -4 })]], {silent = true, expr = true})

-- Snippets
vim.api.nvim_set_keymap('i', '<C-j>', [[vsnip#expandable() ? '<Plug>(vsnip-expand)'     : '<C-j>']], {expr = true})
vim.api.nvim_set_keymap('s', '<C-j>', [[vsnip#expandable() ? '<Plug>(vsnip-expand)'     : '<C-j>']], {expr = true})
