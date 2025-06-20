return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local isMac = vim.fn.has('macunix') == 1
            local homePath = "/home"
            if (isMac) then homePath = "/Users" end
            local vueTypeScriptLocation = string.format(
            "%s/michael/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin",
                homePath)

            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })
            lspconfig.ts_ls.setup({
                capabilities = capabilities,
                init_options = {
                    plugins = {
                        {
                            name = "@vue/typescript-plugin",
                            location = vueTypeScriptLocation,
                            languages = { "javascript", "typescript", "vue" },
                        }
                    }
                },
                filetypes = {
                    "javascript",
                    "typescript",
                    "vue",
                }
            })
            lspconfig.phpactor.setup({
                capabilities = capabilities
            })
            lspconfig.cssls.setup({
                capabilities = capabilities
            })

            local emmetCapabilities = capabilities
            emmetCapabilities.textDocument.completion.completionItem.snippetSupport = true
            lspconfig.emmet_ls.setup({
                capabilities = emmetCapabilities,
                filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact", "svelte", "vue" }
            })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gD", vim.lsp.buf.definition, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set('n', "gr", vim.lsp.buf.references, {})
            vim.keymap.set('n', "gi", vim.lsp.buf.implementation, {})
        end
    }
}
