return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            highlight = {
                enable = true,
            },
            indent = { enable = true },
            autostage = { enable = true },
            ensure_installed = {
                "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline",
            },
            auto_install = false,
        })
    end
}
