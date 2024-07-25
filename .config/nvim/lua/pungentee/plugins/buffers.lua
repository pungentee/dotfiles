return {
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"roobert/bufferline-cycle-windowless.nvim",
		},
		keys = {
			{ "{", "<cmd>BufferLineMovePrev<cr>" },
			{ "}", "<cmd>BufferLineMoveNext<cr>" },
			{ "]", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer", nowait = true },
			{ "[", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous Buffer", nowait = true },
		},
		config = function()
			local bufferline = require("bufferline")

			bufferline.setup({
				options = {
					style_preset = bufferline.style_preset_minimal,
					numbers = "none",
					themable = true,
					right_mouse_command = false,
					left_mouse_command = false,
					diagnostics = "nvim_lsp",
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
					highlights = {},
				},
			})
		end,
	},
}
