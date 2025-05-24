return {
    {
        "nvim-telescope/telescope.nvim", tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local builtin = require("telescope.builtin")
            local actions = require("telescope.actions")

            vim.keymap.set("n", "<leader>fa", builtin.find_files, {})
            vim.keymap.set("n", "<leader>ff", builtin.git_files, {})
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
            vim.keymap.set("n", "<leader>fr", builtin.lsp_references, {})
            vim.keymap.set("n", "gd", builtin.lsp_definitions, {})
            vim.keymap.set("n", "<leader>fb", builtin.buffers, {})

            require("telescope").setup({
              defaults = {
                mappings = {
                  i = {
                    ["<C-j>"] = actions.preview_scrolling_down,
                    ["<C-k>"] = actions.preview_scrolling_up,
                  },
                  n = {
                    ["<C-j>"] = actions.preview_scrolling_down,
                    ["<C-k>"] = actions.preview_scrolling_up,
                  }
                }
              }
            })
        end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {}
                    }
                }
            })
            require("telescope").load_extension("ui-select")
        end
    },
    {
        "isak102/telescope-git-file-history.nvim",
        config = function()
            vim.keymap.set('n', "<leader>fh", '<cmd>Telescope git_file_history<CR>', {})
            require("telescope").load_extension("git_file_history")
        end
    },
    {
        "jemag/telescope-diff.nvim",
        config = function()
            require("telescope").load_extension("diff")
            vim.keymap.set("n", "<leader>fd", function()
                require("telescope").extensions.diff.diff_files({ hidden = true })
            end, { desc = "Compare 2 files" })
        end
    },
}
