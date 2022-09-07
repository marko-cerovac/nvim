---@diagnostic disable: undefined-global
return {
	s("req", fmt("local {} = require(\"{}\")", { i(1, "module"), rep(1)}))
}
