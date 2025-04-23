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
		"tpope/vim-commentary"
	},
	{
		"kdheepak/lazygit.nvim",
		config = function()
			vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", {})
		end,
	},
}
