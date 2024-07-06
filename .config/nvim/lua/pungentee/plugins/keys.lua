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
			wk.setup()

			wk.register({
				f = { name = "find something" },
				d = { name = "diagnostics" },
				l = {
					name = "file actions",
					L = {
						"<cmd>LspInfo<cr>",
						"Lsp info",
					},
				},
				w = { name = "windows" },
				n = { name = "notifications" },
				g = { name = "git" },
				m = { name = "markdown" },
			}, { mode = "n", prefix = "<leader>" })
		end,
	},
}
