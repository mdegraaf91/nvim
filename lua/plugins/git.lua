return {
	{
		"lewis6991/gitsigns.nvim",
        version = "0.7",
		config = function()
			require("gitsigns").setup()

			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
		end,
	},
	{
		"tpope/vim-fugitive",
	},
	{
		"tpope/vim-commentary",
		config = function()
			local ts_utils = require("nvim-treesitter.ts_utils")

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "vue",
				callback = function()
					local function set_commentstring()
						local node = ts_utils.get_node_at_cursor()
						if not node then return end

						local node_type = node:type()
						if node_type == "template_element" then
							vim.opt_local.commentstring = "<!-- %s -->"
						end
					end

					vim.api.nvim_create_autocmd("CursorMoved", {
						buffer = 0,
						callback = set_commentstring,
					})
				end
			})
		end
	},
	{
		"kdheepak/lazygit.nvim",
		config = function()
			vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", {})
		end,
	},
}
