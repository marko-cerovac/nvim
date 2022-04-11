require("gitsigns").setup {
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
