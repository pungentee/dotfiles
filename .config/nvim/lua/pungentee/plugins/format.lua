return {
	{
		"stevearc/conform.nvim",
		dependencies = {
			"folke/which-key.nvim",
		},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					-- javascriptreact = { "prettier" },
					-- typescriptreact = { "prettier" },
					-- vue = { "prettier" },
					-- scss = { "prettier" },
					-- less = { "prettier" },
					-- html = { "prettier" },
					-- css = { "prettier" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					json = { "prettier" },
					jsonc = { "prettier" },
					graphql = { "prettier" },
					handlebars = { "prettier" },
					go = { "gofumpt", "goimports", "golines" },
					gomod = { "gofumpt" },
					c = { "clang-format" },
					cpp = { "clang-format" },
					cmake = { "gersemi" },
					yaml = { "prettier" },
					lua = { "stylua" },
					markdown = { "markdownlint" },
					python = { "ruff_format", "ruff_fix" },
					rust = { "rustfmt" },
					sql = { "sql_formatter" },
					haskell = { "fourmolu" },
				},

				formatters = {
					black = {
						prepend_args = { "--fast" },
					},
				},
			})

			vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
				callback = function(event)
					require("which-key").register({
						l = {
							name = "file actions",
							f = {
								function()
									require("conform").format({ bufnr = event.buf })
								end,
								"Format file",
							},
						},
					}, { mode = "n", prefix = "<leader>", buffer = event.buf })
				end,
			})
		end,
	},
}
