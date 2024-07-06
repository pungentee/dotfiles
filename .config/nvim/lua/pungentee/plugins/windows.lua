return {
	{
		"famiu/bufdelete.nvim",
		event = "VeryLazy",
		version = "*",
		keys = {
			{
				"<leader>x",
				"<cmd>Bdelete<cr>",
				desc = "Delete current buffer",
			},
		},
	},
	{
		"sindrets/winshift.nvim",
		event = { "BufReadPre", "BufNewFile", "VeryLazy" },
		keys = {
			{ "<leader>wm", "<cmd>WinShift<cr>", desc = "Move window" },
		},
		config = true,
	},
}
