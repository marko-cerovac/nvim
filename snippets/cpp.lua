---@diagnostic disable: undefined-global
return {
	s("sst",
		fmt([[
		#include <iostream>

		int main({}) {{
			{}
		}}
		]],
		{
			c(1, { t "", t "int argc, char** argv"}),
			i(0, "// write some code...")
		})
	),

	s("main",
		fmt([[
		int main({}) {{
			{}
		}}
		]],
		{
			c(1, { t "", t "int argc, char** argv"}),
			i(0, "// write some code...")
		})
	),

	s("class",
		fmt([[
		class {} {} {{
			public:

			{}(){};
			{}(const {} &other);
			{}~{}();

			private:

			{}
		}};
		]],
		{
			i(1, "class name"),
			i(2),
			rep(1),
			c(3, { t "", t " = default"}),
			rep(1),
			rep(1),
			f(function (is_derived)
				if is_derived[1][1] == "" then
					return ""
				else
					return "virtual "
				end
			end, {2}),
			rep(1),
			i(0)
		})
	),

    s("interface",
        fmt([[
        class {} {{
            public:
            virtual ~{}() {{}};
            {}
        }};
        ]],
        {
            i(1, "ClassName"),
            rep(1),
            i(0)
        })
    )
}
