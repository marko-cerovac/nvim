local telescope = require('telescope')

telescope.setup{
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
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
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
	-- path_display = {"tail", "absolute"},
    winblend = 0,
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
  --[[ extensions = {
    fzy_native = {
          override_generic_sorter = false,
          override_file_sorter = true,
    }
  } ]]
}

-- telescope.load_extension('fzy_native')
-- telescope.load_extension('media_files')

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
local map = require('core.functions').map
-- Telescope finder
map('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<CR>]])
map('n', '<leader>fe', [[<cmd>lua require('telescope.builtin').file_browser({hidden=true})<CR>]])
map('n', '<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]])
map('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
map('n', '<leader>fr', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]])
map('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]])
map('n', '<leader>fa', [[<cmd>lua require('telescope.builtin').lsp_code_actions()<CR>]])
map('n', '<leader>fo', [[<cmd>lua require('telescope.builtin').vim_options()<CR>]])
map('n', '<leader>fc', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]])
map('n', '<leader>fm', [[<cmd>lua require('telescope.builtin').man_pages()<CR>]])
map('n', '<leader>ft', [[<cmd>lua require('telescope.builtin').colorscheme()<CR>]])

-- Telescope git
map('n', '<leader>gf', [[<cmd>lua require('telescope.builtin').git_files()<CR>]])
map('n', '<leader>gc', [[<cmd>lua require('telescope.builtin').git_commits()<CR>]])
map('n', '<leader>gb', [[<cmd>lua require('telescope.builtin').git_branches()<CR>]])
map('n', '<leader>gi', [[<cmd>lua require('telescope.builtin').git_status()<CR>]])

-- Telescope NeoVim rc
map('n', '<leader>fs', [[<cmd>lua require('plugins.telescope').neovim_rc()<CR>]])

return { neovim_rc = neovim_rc }
