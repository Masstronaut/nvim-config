return {
	{
		"tpope/vim-fugitive",
	},
	{
		"lewis6991/gitsigns.nvim",
		lazy = false, -- disable lazy loading
		config = function()
			require("gitsigns").setup()
		end,
		keys = {
			{ "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", desc = "Git Preview hunk" },
			{ "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", desc = "Git blame current line" },
			{ "<leader>gd", "<cmd>Gitsigns diffthis<cr>", desc = "Git Diff" },
		},
	},
}
