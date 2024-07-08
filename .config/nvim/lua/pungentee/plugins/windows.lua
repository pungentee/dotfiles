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
	{
		"mrjones2014/smart-splits.nvim",
        lazy = false,
		keys = {
			{
				"<leader>wr",
				function()
					require("smart-splits").start_resize_mode()
				end,
				desc = "Start window resizing mode",
			},
			{
				"<C-h>",
				function()
					require("smart-splits").move_cursor_left()
				end,
			},
			{
				"<C-l>",
				function()
					require("smart-splits").move_cursor_right()
				end,
			},
			{
				"<C-j>",
				function()
					require("smart-splits").move_cursor_down()
				end,
			},
			{
				"<C-k>",
				function()
					require("smart-splits").move_cursor_up()
				end,
			},
		},
		config = true,
	},

	{
		"kwkarlwang/bufresize.nvim",
		config = function()
			require("bufresize").setup()
		end,
	},
}
