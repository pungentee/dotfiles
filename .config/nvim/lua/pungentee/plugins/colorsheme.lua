return {
	{
		"f-person/auto-dark-mode.nvim",

		dependencies = {
			"nyoom-engineering/oxocarbon.nvim",
			"miikanissi/modus-themes.nvim",
		},

		lazy = false,
		priority = 1000,
		init = function()
			local auto_dark_mode = require("auto-dark-mode")

			auto_dark_mode.setup({
				update_interval = 1000,
				set_dark_mode = function()
					vim.o.background = "dark"
					vim.cmd.colorscheme("oxocarbon")
				end,

				set_light_mode = function()
					vim.o.background = "light"
					vim.cmd.colorscheme("modus")
				end,
			})
		end,
	},

	{
		"nyoom-engineering/oxocarbon.nvim",
		lazy = false,
		priority = 1000,
	},

	{
		"miikanissi/modus-themes.nvim",
		lazy = false,
		priority = 1000,
		init = function()
			vim.o.background = "light"
			vim.cmd.colorscheme("modus")
		end,
	},
}
