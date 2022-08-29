local status_ok, ts = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	vim.notify ("Module treesitter not found", vim.log.levels.WARN)
	return
end

ts.setup {
	ensure_installed = { "c", "cpp", "make", "lua", "rust", "bash", "java" },
	highlight = { enable = true },
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["ab"] = "@block.outer",
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
				["ai"] = "@conditional.outer",
				["ii"] = "@conditional.inner",
				["al"] = "@loop.outer",
				["il"] = "@loop.inner",
				["ak"] = "@comment.outer",
			},
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["]f"] = "@function.outer",
				["]b"] = "@block.outer",
			},
			goto_next_end = {
				["]F"] = "@function.outer",
				["]B"] = "@block.outer",
			},
			goto_previous_start = {
				["[f"] = "@function.outer",
				["[b"] = "@block.outer",
			},
			goto_previous_end = {
				["[F"] = "@function.outer",
				["[B"] = "@block.outer",
			},
		},
	},
}

vim.cmd "set foldexpr=nvim_treesitter#foldexpr()"
