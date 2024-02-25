return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = { "lua", "vim", "php", "javascript", "typescript", "json", "html", "vue", "scss", "css", "python", "yaml", "gitignore" },
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
