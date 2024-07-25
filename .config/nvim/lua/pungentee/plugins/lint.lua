return {
	{
		"mfussenegger/nvim-lint",
		lazy = false,
		dependencies = {
			"folke/which-key.nvim",
		},
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
				callback = function()
					require("which-key").add({
						{
							"<leader>ll",
							function()
								require("lint").try_lint()
							end,
							desc = "Try lint",
						},
					})
				end,
			})
		end,
	},
}
