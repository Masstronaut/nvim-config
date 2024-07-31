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
			{ "<leader>gp", ":Gitsigns preview_hunk<CR>" },
			{ "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>" },
		},
	},
}
