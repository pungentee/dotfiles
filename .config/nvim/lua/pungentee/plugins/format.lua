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
					jsonc = { "peettier" },
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
					rust = { "rustfmt" },
					sql = { "sql_formatter" },
					haskell = { "fourmolu" },
					python = { "ruff_format" },
				},
			})

			vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
				callback = function()
					require("which-key").add({
						{
							"<leader>lf",
							function()
								require("conform").format()
							end,
							desc = "Format file",
						},
					})
				end,
			})
		end,
	},
}
