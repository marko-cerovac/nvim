local status_ok, gs = pcall(require, "gitsigns")
if not status_ok then
	vim.notify "Module gitsigns not found"
	return
end

gs.setup {
	signs = {
		add          = {hl = "GitSignsAdd"   , text = "│", numhl="GitSignsAddNr"   , linehl="GitSignsAddLn"},
		change       = {hl = "GitSignsChange", text = "│", numhl="GitSignsChangeNr", linehl="GitSignsChangeLn"},
		delete       = {hl = "GitSignsDelete", text = "_", numhl="GitSignsDeleteNr", linehl="GitSignsDeleteLn"},
		topdelete    = {hl = "GitSignsDelete", text = "‾", numhl="GitSignsDeleteNr", linehl="GitSignsDeleteLn"},
		changedelete = {hl = "GitSignsChange", text = "│", numhl="GitSignsChangeNr", linehl="GitSignsChangeLn"},
	},
	preview_config = {
		-- Options passed to nvim_open_win
		border = vim.g.border_style,
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1
	},

	on_attach = function (bufnr)
		local map = vim.keymap.set
		local opts = { noremap = true, silent = true }

		map("n", "]g", function()
			if vim.wo.diff then return "]c" end
			vim.schedule(function() gs.next_hunk() end)
			return "<Ignore>"
		end, {expr=true})

		map("n", "[g", function()
			if vim.wo.diff then return "[c" end
			vim.schedule(function() gs.prev_hunk() end)
			return "<Ignore>"
		end, {expr=true})

		map ({"n", "v"}, "<leader>ga", gs.stage_hunk, opts)
		map ({"n", "v"}, "<leader>gr", gs.reset_hunk, opts)
		map ({"n", "v"}, "<leader>gR", gs.reset_buffer, opts)
		map ({"n", "v"}, "<leader>gp", gs.preview_hunk, opts)
		map ({"n", "v"}, "<leader>gl", gs.toggle_current_line_blame, opts)
		map ({"n", "v"}, "<leader>gd", gs.diffthis, opts)

		-- Text object
		map({"o", "x"}, "ih", ":<C-U>Gitsigns select_hunk<CR>")
	end
}

