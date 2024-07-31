return {
  {
    "tpope/vim-fugitive",
  },
	{

		"lewis6991/gitsigns.nvim",
		opts = {},
    lazy = false,
		keys = {
			{ "<leader>gp", ":Gitsigns preview_hunk<CR>" },
			{ "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>" },
		},
	},
}
