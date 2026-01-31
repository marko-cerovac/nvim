---@diagnostic disable: undefined-global
local postfix = require("luasnip.extras.postfix").postfix

local get_minuses = function(tbl_header)
    local trimmed = tbl_header[1][1]:match("^%s*(.-)%s*$")

    local count = trimmed and #trimmed or 0
    return string.rep("-", count)
end

local parse_table_dims = function(trigger)
    local rows, cols = trigger:match("^(%d*)x(%d*)$")

    if rows and cols then
        return tonumber(rows), tonumber(cols)
    else
        return nil, nil
    end
end

local generate_row = function(cols)
    local cells = {}

    -- add leading '|'
    table.insert(cells, t "|")

    for id = 1, cols do
        table.insert(cells, t " ")
        table.insert(cells, i(id))
        table.insert(cells, t " |")
    end
    table.insert(cells, t({ "", "" }))

    return cells
end

local generate_separator = function(header, cols)
    -- add a newline
    table.insert(header, t("|"))

    for id = 1, cols do
        table.insert(header, f(get_minuses, { id }))
        table.insert(header, t "--|")
    end
    table.insert(header, t({ "", "" }))
end

local generate_table = function(rows, cols)
    local tbl = {}

    local header = generate_row(cols)
    generate_separator(header, cols)
    table.insert(tbl, sn(1, header))

    for id = 2, rows do
        table.insert(tbl, sn(id, generate_row(cols)))
    end

    return sn(nil, tbl)
end

return {
    postfix(".bl", {
        d(1, function(_, parent)
            return sn(nil, {
                t({ "> [!" .. string.upper(parent.snippet.env.POSTFIX_MATCH) .. "]", "> " }),
                i(1, "text...")
            })
        end)
    }),

    postfix(".tbl", {
        d(1, function(_, parent)
            local rows, cols = parse_table_dims(parent.snippet.env.POSTFIX_MATCH)

            if rows == nil or cols == nil then
                return sn(nil, { t({ "**POOF**... where's the table?" }) })
            end

            return generate_table(rows, cols)
        end)
    }),

    s("code",
        fmt([[
        ```{}
        {}
        ```
        ]],
            {
                i(1),
                i(0, 'code'),
            })
    ),
}
