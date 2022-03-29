require("gitsigns").setup {
	-- keymaps = {
	-- 	-- Default keymap options
	-- 	noremap = true,

	-- 	["n ]g"] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"},
	-- 	["n [g"] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"},


	-- 	["n <leader>gs"] = "<cmd>lua require'gitsigns'.stage_hunk()<CR>",
	-- 	["v <leader>gs"] = "<cmd>lua require'gitsigns'.stage_hunk({vim.fn.line('.'), vim.fn.line('v')})<CR>",
	-- 	["n <leader>gS"] = "<cmd>lua require'gitsigns'.stage_buffer()<CR>",
	-- 	["n <leader>gd"] = "<cmd>lua require'gitsigns'.diff_this()<CR>",
	-- 	["n <leader>gu"] = "<cmd>lua require'gitsigns'.undo_stage_hunk()<CR>",
	-- 	["n <leader>gr"] = "<cmd>lua require'gitsigns'.reset_hunk()<CR>",
	-- 	["v <leader>gr"] = "<cmd>lua require'gitsigns'.reset_hunk({vim.fn.line('.'), vim.fn.line('v')})<CR>",
	-- 	["n <leader>gR"] = "<cmd>lua require'gitsigns'.reset_buffer()<CR>",
	-- 	["n <leader>gp"] = "<cmd>lua require'gitsigns'.preview_hunk()<CR>",
	-- 	["n <leader>gl"] = "<cmd>lua require'gitsigns'.toggle_current_line_blame()<CR>",
	-- 	["n <leader>gw"] = "<cmd>lua require'gitsigns'.toggle_word_diff()<CR>",
	-- 	-- ["n <leader>gL"] = "<cmd>lua require'gitsigns'.blame_line{full=true}<CR>",
	-- 	-- ["n <leader>gU"] = "<cmd>lua require'gitsigns'.reset_buffer_index()<CR>",

	-- 	-- Text objects
	-- 	["o ih"] = ":<C-U>lua require'gitsigns'.select_hunk()<CR>",
	-- 	["x ih"] = ":<C-U>lua require'gitsigns'.select_hunk()<CR>"
	-- },

  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']g', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function()
        require("gitsigns").next_hunk()
      end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '[g', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function()
        require("gitsigns").prev_hunk()
      end)
      return '<Ignore>'
    end, {expr=true})

    -- Actions
    map({'n', 'v'}, '<leader>gs', ':Gitsigns stage_hunk<CR>')
    map({'n', 'v'}, '<leader>gr', ':Gitsigns reset_hunk<CR>')
    map('n', '<leader>gS', gs.stage_buffer)
    map('n', '<leader>gu', gs.undo_stage_hunk)
    map('n', '<leader>gR', gs.reset_buffer)
    map('n', '<leader>gp', gs.preview_hunk)
    map('n', '<leader>gL', function() gs.blame_line{full=true} end)
    map('n', '<leader>gl', gs.toggle_current_line_blame)
    map('n', '<leader>gw', gs.toggle_word_diff)
    map('n', '<leader>gd', gs.diffthis)
    map('n', '<leader>gD', function() gs.diffthis('~') end)
    map('n', '<leader>gx', gs.toggle_deleted)

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end,

	current_line_blame_opts = {
		delay = 200,
	},
	preview_config = {
		-- border = "rounded",
		border = "single",
	},
}

-- Load whichkey
require("which-key").register({
    g = {
        name = "git",
        b = "branches",
        c = "commits",
		d = "diff",
		D = "buffer diff",
        f = "files",
        i = "status",
		g = {"<cmd>Neogit<CR>", "open neogit"},
        l = "line blame",
        L = "full line blame",
		p = "preview hunk",
		r = "reset hunk",
		R = "reset buffer",
        s = "stage hunk",
		S = "stage buffer",
		u = "unstage hunk",
		w = "word diff",
		x = "show deleted"
    },
}, { prefix = "<leader>" })
