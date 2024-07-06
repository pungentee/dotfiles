return {
	{
		"alexghergh/nvim-tmux-navigation",
		cmd = {
			"NvimTmuxNavigateLeft",
			"NvimTmuxNavigateDown",
			"NvimTmuxNavigateUp",
			"NvimTmuxNavigateRight",
		},
		keys = function()
			local nvim_tmux_nav = require("nvim-tmux-navigation")

			return {
				{ "<c-h>", nvim_tmux_nav.NvimTmuxNavigateLeft, desc = "Move cursor left" },
				{ "<c-j>", nvim_tmux_nav.NvimTmuxNavigateDown, desc = "Move cursor right" },
				{ "<c-k>", nvim_tmux_nav.NvimTmuxNavigateUp, desc = "Move cursor downt" },
				{ "<c-l>", nvim_tmux_nav.NvimTmuxNavigateRight, desc = "Move cursor up" },
			}
		end,
	},
}
