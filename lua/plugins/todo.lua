return {
    "folke/todo-comments.nvim",
    config = function()
        require("todo-comments").setup()

        vim.keymap.set('n', "<leader>to", '<cmd>TodoTrouble<CR>', {})
    end
}
