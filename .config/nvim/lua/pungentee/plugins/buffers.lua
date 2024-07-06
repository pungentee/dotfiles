return {
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"roobert/bufferline-cycle-windowless.nvim",
			"projekt0n/github-nvim-theme",
			"catppuccin/nvim",
		},
		keys = {
			{ "{", "<cmd>BufferLineMovePrev<cr>" },
			{ "}", "<cmd>BufferLineMoveNext<cr>" },
		},
		config = function()
			local bufferline = require("bufferline")

			local highlights = {}

			-- if vim.o.background == "dark" then
			-- 	highlights = require("catppuccin.groups.integrations.bufferline").get()
			-- end

			bufferline.setup({
				options = {
					style_preset = bufferline.style_preset_minimal,
					numbers = "none",
					right_mouse_command = false,
					left_mouse_command = false,
					diagnostics = "nvim_lsp",
					diagnostics_update_in_insert = true,
					show_buffer_close_icons = false,
					show_close_icon = false,
					show_tab_indicators = true,
					show_duplicate_prefix = true,
					hover = {
						enabled = false,
						delay = 200,
						reveal = { "close" },
					},
					always_show_bufferline = true,
					offsets = {
						{
							filetype = "NvimTree",
							text = "File Explorer",
							text_align = "center",
						},
					},
				},
				highlights = highlights,
			})
		end,
	},
	{
		"roobert/bufferline-cycle-windowless.nvim",
		event = { "BufEnter", "VeryLazy" },
		dependencies = {
			{ "akinsho/bufferline.nvim" },
		},
		keys = {
			{ "]", "<cmd>BufferLineCycleWindowlessNext<cr>", desc = "Next Buffer", nowait = true },
			{ "[", "<cmd>BufferLineCycleWindowlessPrev<cr>", desc = "Previous Buffer", nowait = true },
		},
		config = function()
			require("bufferline-cycle-windowless").setup({
				default_enabled = true,
			})
		end,
	},
}
