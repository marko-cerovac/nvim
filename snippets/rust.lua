---@diagnostic disable: undefined-global
return {
    s('tests',
        fmt([[
        #[cfg(test)]
        mod tests {{
            use super::*;

            #[test]
            fn {}() {{
                {}
            }}
        }}
        ]],
        {
            i(1, 'test_name'),
            i(0, "// let's assert some stuff"),

        })),
    s('derivedebug', t '#[derive(Debug)]'),
    s('usualderives', t '#[derive(Clone, Debug, Default)]'),
    s('deadcode', t '#[allow(dead_code)]'),
    s('for',
        fmt([[
        for {} in {} {{
            {}
        }}
        ]],
        {
            i(1, 'i'), i(2, '&collection'),
            i(0, '// logic')
        }))
}
