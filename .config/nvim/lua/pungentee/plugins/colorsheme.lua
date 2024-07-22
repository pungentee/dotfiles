local transparent_background = function()
	local groups = {
		"Normal",
		"NormalNC",
		"NonText",
		-- "StatusLine",
		-- "StatusLineNC",
		"EndOfBuffer",
	}

	for _, value in ipairs(groups) do
		vim.api.nvim_set_hl(0, value, { bg = "none" })
	end
end

return {
	{
		"f-person/auto-dark-mode.nvim",

		dependencies = {
			"nyoom-engineering/oxocarbon.nvim",
			"miikanissi/modus-themes.nvim",

			"nvim-lualine/lualine.nvim",
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

					transparent_background()
				end,

				set_light_mode = function()
					vim.o.background = "light"
					vim.cmd.colorscheme("modus")

					transparent_background()
				end,
			})
		end,
	},

	{
		"nyoom-engineering/oxocarbon.nvim",
		lazy = false,
		priority = 1000,
		init = function()
			vim.o.background = "dark"
			vim.cmd.colorscheme("oxocarbon")

			transparent_background()
		end,
	},

	{
		"miikanissi/modus-themes.nvim",
		lazy = false,
		priority = 1000,
        opts = {
            transparent = true,

        }
	},
}
