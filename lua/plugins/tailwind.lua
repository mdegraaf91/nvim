return
{
    {
        "luckasRanarison/tailwind-tools.nvim",
        name = "tailwind-tools",
        build = ":UpdateRemotePlugins",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-telescope/telescope.nvim", -- optional
            "neovim/nvim-lspconfig",         -- optional
        },
        opts = {
            document_color = {
                enabled = false
            }
        }
    },
    {
        'razak17/tailwind-fold.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        ft = { 'html', 'svelte', 'astro', 'vue', 'typescriptreact', 'php', 'blade' },
        opts = {
            highlight = {
                fg = "#878709"
            }
        },
    },
    {
        'rodrigore/coc-tailwind-intellisense',
    }
}
