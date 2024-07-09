return {
	{
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter", "CmdlineEnter", "VeryLazy" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
			"saadparwaiz1/cmp_luasnip",
			"onsails/lspkind.nvim",
			{
				"Saecki/crates.nvim",
				event = { "BufRead Cargo.toml" },
				opts = {},
			},
			-- "supermaven-inc/supermaven-nvim",
		},
		config = function()
			local luasnip = require("luasnip")
			local cmp = require("cmp")
			-- local suggestion = require("supermaven-nvim.completion_preview")
			local lspkind = require("lspkind")

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},

				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},

				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol_text",
						preset = "default",
						maxwidth = 50,
						-- symbol_map = { Supermaven = "" },
					}),
				},

				preselect = "item",

				completion = {
					completeopt = "menu,menuone,noinsert",
				},

				mapping = cmp.mapping.preset.insert({
					["<C-e>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							if luasnip.expandable() then
								luasnip.expand()
							-- elseif suggestion.has_suggestion() then
							-- 	suggestion.on_accept_suggestion()
							else
								cmp.confirm({
									select = true,
								})
							end
						else
							fallback()
						end
					end),
					["<C-c>"] = cmp.mapping({ i = cmp.mapping.close(), c = cmp.mapping.close() }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = {
					{ name = "nvim_lsp" },
					{ name = "nvim_lsp_signature_help" },
					{ name = "crates" },
					-- { name = "supermaven" },
					{ name = "path" },
					{ name = "luasnip" },
					{ name = "nvim_lua" },
				},
			})
		end,
	},
}
