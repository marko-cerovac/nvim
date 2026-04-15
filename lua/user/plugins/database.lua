return {
    {
        "kndndrj/nvim-dbee",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
        cmd = { "Dbee" },
        build = function()
            -- Install tries to automatically detect the install method.
            -- if it fails, try calling it with one of these parameters:
            --    "curl", "wget", "bitsadmin", "go"
            require("dbee").install()
        end,
        config = function()
            require("dbee").setup({
                sources = {
                    require("dbee.sources").MemorySource:new({
                        {
                            name = "Local MariaDB (Socket)",
                            type = "mysql", -- MariaDB uses the mysql driver type in dbee
                            url = "marko@unix(/run/mysqld/mysqld.sock)/periodization_tracker",
                        },
                    })
                }
            })
        end,
    },
}
