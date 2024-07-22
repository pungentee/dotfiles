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
			"mellow-theme/mellow.nvim",
			-- "nyoom-engineering/oxocarbon.nvim",
			"NTBBloodbath/sweetie.nvim",
			-- "NLKNguyen/papercolor-theme",

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

					vim.cmd.colorscheme("mellow")

					require("lualine").setup({
						sections = {
							lualine_y = {
								{ "diff", separator = "", padding = { left = 1, right = 1 } },
								{ "diagnostics", separator = "", padding = { left = 1, right = 1 } },
							},
							lualine_z = {
								{ "location", separator = "", padding = { left = 0, right = 1 } },
							},
						},
					})

					transparent_background()
				end,

				-- set_dark_mode = function()
				-- 	vim.o.background = "dark"
				--
				-- 	vim.cmd.colorscheme("oxocarbon")
				--
				-- 	transparent_background()
				-- end,

				set_light_mode = function()
					vim.o.background = "light"
					vim.g.PaperColor_Theme_Options = {
						theme = {
							default = {
								transparent_background = 1,
							},
						},
					}

					vim.cmd.colorscheme("sweetie")

					-- require("lualine").setup({
					-- 	sections = {
					-- 		lualine_y = {
					-- 			{ "location", separator = "", padding = { left = 0, right = 1 } },
					-- 		},
					-- 		lualine_z = {
					-- 			{ "diff", separator = "", padding = { left = 1, right = 1 } },
					-- 			{ "diagnostics", separator = "", padding = { left = 1, right = 1 } },
					-- 		},
					-- 	},
					-- })

					transparent_background()
				end,
			})
		end,
	},

	-- {
	-- 	"mellow-theme/mellow.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	init = function()
	-- 		vim.o.background = "dark"
	-- 		vim.cmd.colorscheme("mellow")
	-- 		transparent_background()
	-- 	end,
	-- },

	-- {
	-- 	"nyoom-engineering/oxocarbon.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	init = function()
	-- 		vim.o.background = "dark"
	-- 		vim.cmd.colorscheme("oxocarbon")
	--
	-- 		transparent_background()
	-- 	end,
	-- },

	-- {
	-- 	"NTBBloodbath/sweetie.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- },

	-- {
	-- 	"NLKNguyen/papercolor-theme",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- },

	-- {
	-- 	"NLKNguyen/papercolor-theme",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- },
}
