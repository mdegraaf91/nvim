return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting

		null_ls.setup({
			sources = {
				formatting.stylua,
				formatting.prettierd.with({
					filetypes = {
						"css",
						"scss",
						"html",
						"json",
						"yaml",
						"markdown",
                        "php",
                        "jsx",
                        "js",
                        "ss",
                        "vue",
					},
				}),
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
