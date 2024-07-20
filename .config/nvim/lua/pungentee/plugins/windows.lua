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
			{
				"<A-h>",
				function()
					require("smart-splits").resize_left()
				end,
			},
			{
				"<A-l>",
				function()
					require("smart-splits").resize_right()
				end,
			},
			{
				"<A-j>",
				function()
					require("smart-splits").resize_down()
				end,
			},
			{
				"<A-k>",
				function()
                    require("smart-splits").resize_up()
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
