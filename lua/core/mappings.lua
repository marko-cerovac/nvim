local map = require('core.functions').map

-- Map leader to Space
map('n', '<Space>', '<NOP>')
vim.g.mapleader = ' '

-- Window navigation
map('n', '<M-j>', '<C-w>j')
map('n', '<M-k>', '<C-w>k')
map('n', '<M-h>', '<C-w>h')
map('n', '<M-l>', '<C-w>l')

-- Window resizing
map('n', '<C-j>', ':resize -2<CR>')
map('n', '<C-k>', ':resize +2<CR>')
map('n', '<C-h>', ':vertical resize -2<CR>')
map('n', '<C-l>', ':vertical resize +2<CR>')

-- Window splitting
map('n', '<leader>ws', ':split<CR>')
map('n', '<leader>wv', ':vertical split<CR>')
map('n', '<leader>wt', ':tab split<CR>')

-- Window rotating
map('n', '<leader>wr', '<C-w><C-r>')

-- Window moving
map('n', '<leader>wh', '<C-w>H')
map('n', '<leader>wj', '<C-w>J')
map('n', '<leader>wk', '<C-w>K')
map('n', '<leader>wl', '<C-w>L')

-- Switching buffers
map('n', '<TAB>', ':bnext<CR>')
map('n', '<S-TAB>', ':bprevious<CR>')
-- map('n', 'gb', ':bnext<CR>')
-- map('n', 'gB', ':bprevious<CR>')

-- Indenting lines
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Escaping insert mode
map('i', 'jf', '<Esc>')
map('i', 'fj', '<Esc>')
map('i', 'kj', '<Esc>')
-- map('i', 'jj', '<Esc>')

-- Removing search highlight
map('n', '<leader>sh', ':noh<CR>')
map('n', '<leader>h', ':noh<CR>')

-- Opening terminal
map('n', '<leader>v', ':vertical new<CR>:terminal<CR>')
map('n', '<leader>tv', ':vertical new<CR>:terminal<CR>')
map('n', '<leader>ts', ':split new<CR>:terminal<CR>')
map('n', '<leader>tt', ':tab new<CR>:terminal<CR>')
map('t', '<Esc>', '<C-\\><C-n>')

-- Compiling code
map('n', '<leader>cc', ':make<CR>')

-- Toggling settings
map('n', '<leader>sn', [[:lua require('core.functions').number()<CR>]])
map('n', '<leader>sr', [[:lua require('core.functions').relative_number()<CR>]])
map('n', '<leader>sc', [[:lua require('core.functions').cursor_line()<CR>]])
map('n', '<leader>sm', [[:lua require('core.functions').mouse()<CR>]])

-- Toggle Nvim-Tree
map('n', '<leader>e', '<cmd>NvimTreeToggle<CR>')

-- Debugg
-- map('n', '<leader>d', ':lua require("plugins.configs.termdebug")<CR>')

-- Telescope finder
-- map('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<CR>]])
-- map('n', '<leader>fe', [[<cmd>lua require('telescope.builtin').file_browser({hidden=true})<CR>]])
-- map('n', '<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]])
-- map('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
-- map('n', '<leader>fr', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]])
-- map('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]])
-- map('n', '<leader>fa', [[<cmd>lua require('telescope.builtin').lsp_code_actions()<CR>]])
-- map('n', '<leader>fo', [[<cmd>lua require('telescope.builtin').vim_options()<CR>]])
-- map('n', '<leader>fc', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]])
-- map('n', '<leader>fm', [[<cmd>lua require('telescope.builtin').man_pages()<CR>]])
-- map('n', '<leader>ft', [[<cmd>lua require('telescope.builtin').colorscheme()<CR>]])

-- Telescope git
-- map('n', '<leader>gf', [[<cmd>lua require('telescope.builtin').git_files()<CR>]])
-- map('n', '<leader>gc', [[<cmd>lua require('telescope.builtin').git_commits()<CR>]])
-- map('n', '<leader>gb', [[<cmd>lua require('telescope.builtin').git_branches()<CR>]])
-- map('n', '<leader>gi', [[<cmd>lua require('telescope.builtin').git_status()<CR>]])

-- Telescope NeoVim rc
-- map('n', '<leader>fs', [[<cmd>lua require('plugins.configs.telescope').neovim_rc()<CR>]])

-- Toggle indent line
-- map('n', '<leader>si', [[<Cmd>IndentBlanklineToggle<CR>]])

-- Disable kommentary mappings
vim.g.kommentary_create_default_mappings = false

return map
