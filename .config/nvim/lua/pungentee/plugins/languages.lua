return {
	{
		"olexsmir/gopher.nvim",
		ft = { "go", "gomod" },
		build = ":GoInstallDeps",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"folke/which-key.nvim",
		},
		keys = {
			{
				"<leader>le",
				"<cmd>GoIfErr<cr>",
				desc = "Generate error check (go)",
			},
		},
		config = true,
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"j-hui/fidget.nvim",
			"smjonas/inc-rename.nvim",
			"folke/which-key.nvim",
			{
				"b0o/SchemaStore.nvim",
				lazy = true,
				version = false,
			},
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("fidget").setup()

			local capabilities =
				require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

			capabilities.textDocument = {
				foldingRange = {
					dynamicRegistration = false,
					lineFoldingOnly = true,
				},
				completion = {
					completionItem = {
						snippetSupport = false,
					},
				},
			}

			local on_attach = function(_, bufnr)
				local map = function(key, action, desc)
					require("which-key").register({
						[key] = { action, desc },
					}, { prefix = "<leader>l", buffer = bufnr })
				end

				map("r", vim.lsp.buf.rename, "Rename")
				map("a", vim.lsp.buf.code_action, "Code actions")
				map("h", vim.lsp.buf.hover, "Information about the symbol")
				map("D", vim.lsp.buf.declaration, "Go to declaration")
				map("d", function()
					require("telescope.builtin").lsp_definitions({ initial_mode = "normal" })
				end, "Go to defenition")
				map("t", function()
					require("telescope.builtin").lsp_type_definitions({ initial_mode = "normal" })
				end, "Go to type definition")
				map("i", function()
					require("telescope.builtin").lsp_implementations({ initial_mode = "normal" })
				end, "List of implementations")
				map("R", function()
					require("telescope.builtin").lsp_references({ initial_mode = "normal" })
				end, "List of references")
			end

			require("mason-lspconfig").setup({
				handlers = {
					function(server)
						require("lspconfig")[server].setup({
							capabilities = capabilities,
							on_attach = on_attach,
							diagnostics = {
								underline = true,
								update_in_insert = false,
								severity_sort = true,
							},
							format = {
								formatting_options = nil,
								timeout_ms = nil,
							},
						})
					end,

					jsonls = function()
						require("lspconfig").jsonls.setup({
							on_attach = on_attach,
							capabilities = capabilities,
							settings = {
								json = {
									format = {
										enable = true,
									},
									validate = { enable = true },
								},
							},
							diagnostics = {
								underline = true,
								update_in_insert = false,
								severity_sort = true,
							},
							format = {
								formatting_options = nil,
								timeout_ms = nil,
							},
							on_new_config = function(new_config)
								new_config.settings.json.schemas = new_config.settings.json.schemas or {}
								vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
							end,
						})
					end,

					gopls = function()
						require("lspconfig").gopls.setup({
							on_attach = on_attach,
							capabilities = capabilities,
							diagnostics = {
								underline = true,
								update_in_insert = false,
								severity_sort = true,
							},
							format = {
								formatting_options = nil,
								timeout_ms = nil,
							},
							settings = {
								gopls = {
									gofumpt = true,
									analyses = {
										fieldalignment = true,
										nilness = true,
										unusedparams = true,
										unusedwrite = true,
										useany = true,
									},
									usePlaceholders = true,
									staticcheck = true,
									directoryFilters = {
										"-.git",
										"-.vscode",
										"-.idea",
										"-.vscode-test",
										"-node_modules",
									},
									semanticTokens = true,
								},
							},
						})
					end,

					lua_ls = function()
						require("lspconfig").lua_ls.setup({
							on_attach = on_attach,
							capabilities = capabilities,
							diagnostics = {
								underline = true,
								update_in_insert = false,
								severity_sort = true,
							},
							format = {
								formatting_options = nil,
								timeout_ms = nil,
							},
							settings = {
								Lua = {
									runtime = {
										version = "LuaJIT",
									},
									diagnostics = {
										globals = { "vim" },
									},
									workspace = {
										library = {
											vim.env.VIMRUNTIME,
										},
									},
								},
							},
						})
					end,
				},
			})
		end,
	},
}
