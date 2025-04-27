return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        dashboard = {
            width = 60,
            pane_gap = 16,
            sections = {
                {
                    section = "header",
                    align = "center",
                    enabled = function()
                        return not (vim.o.columns > 135)
                    end,
                },
                {
                    pane = 1,
                    {
                        enabled = function()
                            return vim.o.columns > 135
                        end,
                        section = "terminal",
                        cmd = "pokemon-colorscripts -r --no-title; sleep .1",
                        height = 32,
                        width = 56,
                        padding = 1,
                    },
                    {
                        section = "startup",
                        padding = 1,
                        enabled = function()
                            return vim.o.columns > 135
                        end,
                    },
                },
                {
                    pane = 2,
                    { section = "keys", padding = 2, gap = 1 },
                    {
                        icon = " ",
                        title = "Recent Files",
                    },
                    {
                        section = "recent_files",
                        opts = { limit = 3 },
                        indent = 2,
                        padding = 1,
                    },
                },
            },
        },
    },
}
