return {
    "nvim-neo-tree/neo-tree.nvim", branch = "v3.x",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim"
    },
    config = function()
        require("neo-tree").setup({
            popup_border_style = "rounded"
        })
        --vim.keymap.set("n", "<leader>e", ":Neotree source=filesystem reveal=true position=float<CR>")
        vim.keymap.set("n", "<leader>e", ":Neotree source=filesystem reveal=true position=left<CR>")
    end
}
