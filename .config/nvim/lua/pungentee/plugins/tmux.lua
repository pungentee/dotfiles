return {
	-- {
	-- 	"alexghergh/nvim-tmux-navigation",
	-- 	cmd = {
	-- 		"NvimTmuxNavigateLeft",
	-- 		"NvimTmuxNavigateDown",
	-- 		"NvimTmuxNavigateUp",
	-- 		"NvimTmuxNavigateRight",
	-- 	},
	-- 	keys = function()
	-- 		local nvim_tmux_nav = require("nvim-tmux-navigation")
	--
	-- 		return {
	-- 			{ "<c-h>", nvim_tmux_nav.NvimTmuxNavigateLeft, desc = "Move cursor left" },
	-- 			{ "<c-j>", nvim_tmux_nav.NvimTmuxNavigateDown, desc = "Move cursor right" },
	-- 			{ "<c-k>", nvim_tmux_nav.NvimTmuxNavigateUp, desc = "Move cursor downt" },
	-- 			{ "<c-l>", nvim_tmux_nav.NvimTmuxNavigateRight, desc = "Move cursor up" },
	-- 		}
	-- 	end,
	-- },

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
