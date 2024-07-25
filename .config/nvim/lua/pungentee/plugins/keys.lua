return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		module = true,
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		config = function()
			local wk = require("which-key")
			wk.setup({
				preset = "helix",
				icons = {
					mappings = false,
				},
			})

			wk.add({
				{ "<leader>f", group = "find something" },
				{ "<leader>d", group = "diagnostics" },
				{ "<leader>l", group = "lsp actions" },
				{ "<leader>w", group = "windows" },
				{ "<leader>n", group = "notifications" },
				{ "<leader>g", group = "git" },
				{ "<leader>m", group = "markdown" },
			}, { mode = "n", prefix = "<leader>" })
		end,
	},
	{
		"max397574/better-escape.nvim",
		event = "VeryLazy",
		opts = {},
	},
}
