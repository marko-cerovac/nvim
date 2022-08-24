local status_ok, rose_pine = pcall(require, "rose-pine")
if not status_ok then
	vim.notify "Module rose-pine not found"
	return
end

rose_pine.setup({
	dark_variant = "moon",
	disable_float_background = true,
	disable_italics = false,
})
