return {
    {
        "rcarriga/nvim-notify",
        config = function()
            vim.notify = require("notify")

            vim.notify.setup({
                stages = "fade",
                timeout = 3000,
            })

            vim.api.nvim_create_autocmd("BufWritePost", {
                pattern = "*",
                callback = function()
                    vim.notify("Saved file", "info", {
                        timeout = 500,
                        render = 'minimal',
                    })
                end
            })
        end
    }
}
