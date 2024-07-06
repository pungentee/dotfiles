return {
	{
		"f-person/git-blame.nvim",
		event = "VeryLazy",
		keys = {
			{ "<leader>gb", "<cmd>GitBlameToggle<cr>", desc = "Toggle blame" },
		},
		config = function()
			require("gitblame").setup({ enabled = false })
			vim.g.gitblame_message_template = "<author> / <date> / <summary>"
			vim.g.gitblame_display_virtual_text = 0
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		dependencies = { "folke/which-key.nvim" },
		config = function()
			require("gitsigns").setup({
				signcolumn = false,
			})

			require("which-key").register({
				s = { "<cmd>Gitsigns toggle_signs<cr>", "Toggle sign column" },
			}, { prefix = "<leader>g", mode = "n", silent = true })
		end,
	},
}
