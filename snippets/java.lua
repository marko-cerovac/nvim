---@diagnostic disable: undefined-global
return {
    s("main",
        fmt([[
        public class {} {{
            public static void main(String args[]) {{
                {}
            }}
        }}
        ]],
        {
            i(1, "ClassName"),
            i(0, "// write some code...")
        })
    ),
    s("for",
        fmt([[
        for({}; {}; {}) {{
            {}
        }}
        ]],
        {
            i(1, "init-statement"),
            i(2, "condition"),
            i(3, "inc-expression"),
            i(0, "loop body")
        })
    ),
    s("println",
        fmt([[
        System.out.println({}){}
        ]],
        {
            i(1, [["text to be printed"]]),
            i(0)
        })
    ),
    s("print",
        fmt([[
        System.out.print({}){}
        ]],
        {
            i(1, [["text to be printed"]]),
            i(0)
        })
    )
}
