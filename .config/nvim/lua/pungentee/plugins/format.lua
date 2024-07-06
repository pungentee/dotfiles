return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				vue = { "prettier" },
				scss = { "prettier" },
				less = { "prettier" },
				jsonc = { "prettier" },
				graphql = { "prettier" },
				handlebars = { "prettier" },
				go = { "gofumpt", "goimports-reviser", "golines" },
				gomod = { "gofumpt", "goimports-reviser", "golines" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				cmake = { "gersemi" },
				html = { "prettier" },
				css = { "prettier" },
				javascript = { "prettier" },
				json = { "prettier" },
				typescript = { "prettier" },
				yaml = { "prettier" },
				lua = { "stylua" },
				markdown = { "markdownlint" },
				python = { "black", "isort" },
				rust = { "rustfmt" },
				sql = { "sql_formatter" },
			},
		},
		config = function(_, opts)
			require("conform").setup(opts)

			-- vim.api.nvim_create_autocmd("BufWritePre", {
			-- 	pattern = "*",
			-- 	callback = function(args)
			-- 		require("conform").format({ bufnr = args.buf })
			-- 	end,
			-- })

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
