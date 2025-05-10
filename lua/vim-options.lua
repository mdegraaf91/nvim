vim.cmd("set number")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set termguicolors")
vim.cmd("set nowrap")
vim.cmd("set conceallevel=2")
vim.cmd("set cmdheight=0")

vim.g.mapleader = " "
vim.keymap.set({'n', 'v'}, "<leader>c", '"+y', {})
vim.keymap.set({'n', 'v'}, "<leader>v", '"+P', {})
vim.keymap.set({'n', 'v'}, "<C-j>", '<C-W>j', {})
vim.keymap.set({'n', 'v'}, "<C-k>", '<C-W>k', {})
vim.keymap.set({'n', 'v'}, "<C-h>", '<C-W>h', {})
vim.keymap.set({'n', 'v'}, "<C-l>", '<C-W>l', {})
vim.keymap.set({'n', 'v'}, "<C-d>", '<C-d>zz', {})
vim.keymap.set({'n', 'v'}, "<C-u>", '<C-u>zz', {})

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
