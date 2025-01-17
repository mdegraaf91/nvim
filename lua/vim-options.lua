vim.cmd("set number")
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set termguicolors")
vim.cmd("set nowrap")
vim.cmd("set conceallevel=2")
--vim.cmd("set cmdheight=0")

vim.g.mapleader = " "
vim.keymap.set({'n', 'v'}, "<leader>c", '"+y', {})
vim.keymap.set({'n', 'v'}, "<leader>v", '"+P', {})

vim.filetype.add({
    extension = {
        ss = 'html',
        mjml = 'html',
        env = 'sh',
    },
    pattern = {
        [".env.*"] = 'sh'
    }
})
