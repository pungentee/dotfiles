return {
	{
		"mfussenegger/nvim-lint",
		lazy = false,
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				go = { "golangcilint" },
				c = { "cpplint" },
				cpp = { "cpplint" },
				dockerfile = { "hadolint" },
				html = { "htmlhint" },
				javascript = { "eslint" },
				json = { "jsonlint" },
				typescript = { "eslint" },
				yaml = { "yamllint" },
				markdown = { "markdownlint" },
				haskell = { "hlint" },
				python = { "ruff" },
			}

			vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
				callback = function(event)
					require("which-key").register({
						l = {
							name = "file actions",
							l = {
								function()
									require("lint").try_lint()
								end,
								"Try lint",
							},
						},
					}, { mode = "n", prefix = "<leader>", buffer = event.buf })
				end,
			})
		end,
	},
}
