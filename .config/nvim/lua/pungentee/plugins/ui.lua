return {
	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"f-person/git-blame.nvim",
			"projekt0n/github-nvim-theme",
			"catppuccin/nvim",
		},
		config = function()
			local git_blame = require("gitblame")

			local theme = (function()
				if vim.o.background == "dark" then
					return "auto"
				elseif vim.o.background == "light" then
					return "auto"
				end
			end)()

			require("lualine").setup({
				theme = theme,
				options = {
					component_separators = "",
					section_separators = "",
					disabled_filetypes = {
						statusline = { "dashboard" },
					},
				},
				sections = {
					lualine_a = { { "mode", separator = "", padding = { left = 1, right = 1 } } },
					lualine_b = { { "branch", separator = "", padding = { left = 2, right = 1 } } },
					lualine_c = {
						{
							git_blame.get_current_blame_text,
							cond = git_blame.is_blame_text_available,
							separator = "",
							padding = { left = 1, right = 1 },
						},
					},
					lualine_x = {},
					lualine_y = {
						{ "location", separator = "", padding = { left = 0, right = 1 } },
					},
					lualine_z = {
                        { "diff", separator = "", padding = { left = 1, right = 1 } },
                        { "diagnostics", separator = "", padding = { left = 1, right = 1 } },
					},
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = {},
				},
			})
		end,
	},
	{
		"stevearc/dressing.nvim",
		config = true,
	},
	{
		"folke/noice.nvim",
		lazy = false,
		dependencies = { "MunifTanjim/nui.nvim" },
		keys = {
			{ "<leader>nh", "<cmd>Noice history<cr>", desc = "Show messages history" },
			{ "<leader>ne", "<cmd>Noice errors<cr>", desc = "Show errors" },
		},
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
				progress = {
					enabled = false,
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				lsp_doc_border = true,
				inc_rename = true,
			},
		},
	},
}
