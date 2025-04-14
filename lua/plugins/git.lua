return {
	{
		"lewis6991/gitsigns.nvim",
        version = "0.7",
		config = function()
			require("gitsigns").setup()

			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
			vim.keymap.set("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", {})
      vim.opt.signcolumn="yes"
		end,
	},
	{
		"tpope/vim-fugitive",
    config = function()
			vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", {})
    end
	},
	{
		"tpope/vim-commentary",
		config = function()

-- NOTE: this causes big lag

--			local ts_utils = require("nvim-treesitter.ts_utils")
-- 			vim.api.nvim_create_autocmd("FileType", {
-- 				pattern = "vue",
-- 				callback = function()
-- 					local function set_commentstring()
-- 						local node = ts_utils.get_node_at_cursor()
-- 						if not node then return end

-- 						local node_type = node:type()
-- 						if node_type == "template_element" then
-- 							vim.opt_local.commentstring = "<!-- %s -->"
-- 						end
-- 					end

-- 					vim.api.nvim_create_autocmd("CursorMoved", {
-- 						buffer = 0,
-- 						callback = set_commentstring,
-- 					})
-- 				end
-- 			})
		end
	},
	{
		"kdheepak/lazygit.nvim",
		config = function()
			vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", {})
		end,
	},
}
