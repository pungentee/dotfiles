local transparent_background = function()
	local groups = {
		"Normal",
		"NormalNC",
		"NonText",
		"StatusLine",
		"StatusLineNC",
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
			-- "catppuccin/nvim",
		},

		lazy = false,
		priority = 1000,
		init = function()
			local auto_dark_mode = require("auto-dark-mode")

			auto_dark_mode.setup({
				update_interval = 1000,

				-- set_dark_mode = function()
				-- 	vim.o.background = "dark"
				-- 	-- vim.cmd.colorscheme("oxocarbon")
				-- 	vim.cmd.colorscheme("catppuccin-mocha")
				-- end,

				set_dark_mode = function()
					vim.o.background = "dark"

					vim.cmd.colorscheme("oxocarbon")

					transparent_background()
				end,

				set_light_mode = function()
					vim.o.background = "light"

					vim.cmd.colorscheme("sweetie")

					transparent_background()
				end,
			})
		end,
	},

	{
		"nyoom-engineering/oxocarbon.nvim",
		lazy = false,
		priority = 1000,
		-- init = function()
		-- 	vim.o.background = "dark"
		--
		-- 	vim.cmd.colorscheme("oxocarbon")
		--
		-- 	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		-- 	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		-- end,
	},

	{
		"NTBBloodbath/sweetie.nvim",
		lazy = false,
		priority = 1000,
		init = function()
			vim.o.background = "light"

			vim.cmd.colorscheme("sweetie")

			transparent_background()
		end,
	},

	-- {
	-- 	"catppuccin/nvim",
	-- 	name = "catppuccin",
	-- 	priority = 1000,
	-- 	init = function()
	-- 		require("catppuccin").setup({
	-- 			transparent_background = true,
	-- 		})
	-- 	end,
	-- },
}
