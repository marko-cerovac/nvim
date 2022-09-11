---@diagnostic disable: undefined-global
local split = function (module_name)
	local slices = vim.split(module_name[1][1], ".", { plain = true })
	return slices[#slices] or ""
end

return {
	s("require",
		fmt([[local {} = require "{}"]],
		{
			f(split , { 1 }),
			i(1)
		})
	),

	s("p-require",
		fmt([[
		local ok, {} = pcall(require, "{}")
		if not ok then
			{}
		end
		]],
		{
			f(split , { 1 }),
			i(1),
			i(0),
		})
	)
}
