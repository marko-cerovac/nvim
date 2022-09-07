-- Automatically install packer.nvim
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
local needs_bootstraping = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	needs_bootstraping = true
	PACKER_BOOTSTRAP = vim.fn.system {
		"git",
		"clone",
		"--depth 1",
		"https://github.com/wbthomason/packer.nvim",
		install_path
	}
	vim.notify "Installing packer.nvim."
	vim.cmd "packadd packer.nvim"
end

local packer = require "packer"

-- Automatically install plugins on bootstrap
if needs_bootstraping then
	packer.sync()
end

-- make packer use a floating window
packer.init({
	display = {
		prompt_border = vim.g.border_style,
		open_fn = function ()
			return require("packer.util").float { border = vim.g.border_style }
		end
	}
})

return packer
