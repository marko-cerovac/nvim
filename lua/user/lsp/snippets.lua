local ls    = require "luasnip"
local types = require "luasnip.util.types"
local map   = vim.keymap.set
local opts  = { silent = true }

ls.setup {
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true,

    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { " Choice", "TSComment" } },
            },
        },
    },
}

map({"i", "s"}, "<M-e>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, opts)

map({"i", "s"}, "<M-l>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end)

map({"i", "s"}, "<M-h>", function()
    if ls.expand_or_jumpable(-1) then
        ls.expand_or_jump(-1)
    end
end)

require("luasnip.loaders.from_lua").lazy_load {
    paths = vim.fn.stdpath "config" .. "/snippets",
}
