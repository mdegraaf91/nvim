return {
    'VonHeikemen/fine-cmdline.nvim',
    dependencies = {
        "MunifTanjim/nui.nvim"
    },
    config = function()
        require('fine-cmdline').setup({
            popup = {
                position = {
                    row = '30%'
                }
            }
        })
        vim.keymap.set("n", ":", "<cmd>FineCmdline<CR>", { noremap=true })
    end
}
