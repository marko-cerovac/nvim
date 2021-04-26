--        ___           ___
--       /\  \         /\__\       Marko Cerovac
--      |::\  \       /:/  /       marko.cerovac16@gmail.com
--      |:|:\  \     /:/  /        https://github.com/marko-cerovac
--    __|:|\:\  \   /:/  /  ___
--   /::::|_\:\__\ /:/__/  /\__\
--   \:\~~\  \/__/ \:\  \ /:/  /
--    \:\  \        \:\  /:/  /    Group: NeoVim
--     \:\  \        \:\/:/  /     Origin: github.com/marko-cerovac/mc-neovim
--      \:\__\        \::/  /      File: plugins/telescope.lua
--       \/__/         \/__/       Desc: telescope settings


require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_position = "bottom",
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_defaults = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
  },
  extensions = {
    fzy_native = {
          override_generic_sorter = false,
          override_file_sorter = true,
    }
  }
}

require('telescope').load_extension('fzy_native')

-- Key remaps
vim.api.nvim_set_keymap('n', '<Leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fr', [[<cmd>lua require('telescope.builtin').lsp_references()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fa', [[<cmd>lua require('telescope.builtin').lsp_code_actions()<CR>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>gf', [[<cmd>lua require('telescope.builtin').git_files()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gc', [[<cmd>lua require('telescope.builtin').git_commits()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gb', [[<cmd>lua require('telescope.builtin').git_branches()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gs', [[<cmd>lua require('telescope.builtin').git_status()<CR>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>gv', [[<cmd>lua require('plugins.telescope').neovim_rc()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fm', [[<cmd>lua require('telescope.builtin').keymaps()<CR>]], { noremap = true, silent = true })

-- Default mappings:
--  <C-n>/<Down>        Next item
--  <C-p>/<Up>	        Previous item
--  j/k	                Next/previous (in normal mode)
--  <CR>	            Confirm selection
--  <C-x>	            go to file selection as a split
--  <C-v>	            go to file selection as a vsplit
--  <C-t>	            go to a file in a new tab
--  <C-u>	            scroll up in preview window
--  <C-d>	            scroll down in preview window
--  <C-c>	            close telescope
--  <Esc>	            close telescope (in normal mode)

local neovim_rc = function ()
    require("telescope.builtin").find_files({
        prompt_title = "NeoVimRC",
        cwd = "~/.config/nvim/",
    })
end

return {
    neovim_rc = neovim_rc
}
