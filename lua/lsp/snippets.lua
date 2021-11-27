local luasnip = require"luasnip"				-- ls
local snippet = luasnip.snippet					-- s
local textNode = luasnip.text_node				-- t
local insertNode = luasnip.insert_node			-- i
local functionNode = luasnip.function_node		-- f
-- local choiceNode = luasnip.choice_node			-- c
-- local snippetNode = luasnip.snippet_node		-- sn
-- local indentNode = luasnip.indent_snippet_node  -- isn
-- local dinamicNode = luasnip.dynamic_node		-- d
-- local events = require("luasnip.util.events")

-- Snippets for all filetypes
luasnip.snippets.all = {
	snippet("fn", {
		-- Simple static text.
		textNode("//Parameters: "),
		-- function, first parameter is the function, second the Placeholders
		-- whose text it gets as input.
		functionNode(function (args) return args[1] end, 2),
		textNode({ "", "function " }),
		-- Placeholder/Insert.
		insertNode(1),
		textNode("("),
		-- Placeholder with initial text.
		insertNode(2, "int foo"),
		-- Linebreak
		textNode({ ") {", "\t" }),
		-- Last Placeholder, exit Point of the snippet. EVERY 'outer' SNIPPET NEEDS Placeholder 0.
		insertNode(0),
		textNode({ "", "}" }),
	}),
}

luasnip.snippets.c = {
	snippet(
		{
			trig = "sst",
			name = "standard starter template",
			descr = "standard template for a bacic C program"
		},
		{
			textNode({
				"#include <stdio.h>",
				"",
				"int main()",
				"{",
				"\t"
			}),
			insertNode(0, "//Write some code"),
			textNode({
				"",
				"\treturn 0;",
				"}"
			})
		}
	),
	snippet(
		{
			trig = "libsst",
			name = "standard library template",
			descr = "basic template with standard libraries"
		},
		{
			textNode({
				"#include <stdio.h>",
				"#include <stdlib.h>",
				"",
				"int main()",
				"{",
				"\t"
			}),
			insertNode(0, "//Write some code"),
			textNode({
				"",
				"\treturn 0;",
				"}"
			})
		}
	),
	snippet(
		{
			trig = "main void",
			name = "main function without args",
			descr = "main function without arguments"
		},
		{
			textNode({
				"int main(void)",
				"{",
				"\t"
			}),
			insertNode(0, "//Write some code"),
			textNode({
				"",
				"\treturn 0;",
				"}"
			})
		}
	),
	snippet(
		{
			trig = "main args",
			name = "main function with args",
			descr = "main function with arguments"
		},
		{
			textNode({
				"int main(int argc, char **argv)",
				"{",
				"\t"
			}),
			insertNode(0, "//Write some code"),
			textNode({
				"",
				"\treturn 0;",
				"}"
			})
		}
	),
	snippet(
		{
			trig = "printf",
			name = "printf function",
			descr = "printf basic usage template"
		},
		{
			textNode({[[printf("]]}),
			insertNode(0, "Hello World!"),
			textNode({[[");]]})
		}
	),
	--[[ snippet(
		{
			trig = "type",
			name = "define C type",
			descr = "define a type using a struct"
		},
		{
			textNode({"// Type name:\t"}),
			functionNode(function (args) return args[0] end, 0),
			textNode({"", "// Type variables:", ""}),
			functionNode(function (args) return args[2] end, 2),
			textNode({"typedef struct "}),
			insertNode(1, "struct name"),
			textNode({ "", "{", "\t" }),
			insertNode(2, "// type variables"),
			textNode({"", "} "}),
			insertNode(0, "type name"),
			textNode({";"})
		}
	) ]]
}

luasnip.snippets.cpp = {
	snippet(
		{
			trig = "sst",
			name = "standard starter template",
			descr = "standard template for a bacic C++ program"
		},
		{
			textNode({
				"#include <iostream>",
				"",
				"int main()",
				"{",
				"\t"
			}),
			insertNode(0, "// Write some code"),
			textNode({
				"",
				"}"
			})
		}
	),
	snippet(
		{
			trig = "main void",
			name = "void main function",
			descr = "main function without parameters"
		},
		{
			textNode({
				"int main()",
				"{",
				"\t"
			}),
			insertNode(0, "// Write some code"),
			textNode({
				"",
				"}"
			})
		}
	)
}
