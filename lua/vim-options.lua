vim.cmd("set number")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set termguicolors")
vim.cmd("set nowrap")
vim.cmd("set conceallevel=2")
vim.cmd("set cmdheight=0")
vim.cmd("set shortmess+=I") -- hide info at startup

vim.g.mapleader = " "
vim.keymap.set({'n', 'v'}, "<leader>c", '"+y', {})
vim.keymap.set({'n', 'v'}, "<leader>v", '"+P', {})
vim.keymap.set({'n', 'v'}, '<C-j>', '<C-d>zz', {})
vim.keymap.set({'n', 'v'}, '<C-k>', '<C-u>zz', {})
vim.keymap.set({'n', 'v'}, "<C-h>", '<C-W>h', {})
vim.keymap.set({'n', 'v'}, "<C-l>", '<C-W>l', {})

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
