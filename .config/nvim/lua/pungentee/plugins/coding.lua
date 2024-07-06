return {
	{
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		config = true,
	},
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		dependencies = {
			{
				"JoosepAlviste/nvim-ts-context-commentstring",
				lazy = true,
				opts = {
					enable_autocmd = false,
				},
			},
		},
		config = function()
			vim.cmd("unmap gcc")
			vim.cmd("unmap gc")

			require("mini.comment").setup({
				custom_commentstring = function()
					return require("ts_context_commentstring.internal").calculate_commentstring()
						or vim.bo.commentstring
				end,
				mappings = {
					comment = "<leader>c",
					comment_line = "<leader>c",
					comment_visual = "<leader>c",
					textobject = "<leader>c",
				},
			})
		end,
	},
	{
		"max397574/better-escape.nvim",
		event = "VeryLazy",
		opts = {
			mapping = { "jk", "kj" },
		},
	},
	{
		"gbprod/yanky.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		keys = {
			{
				"<leader>p",
				function()
					require("telescope").extensions.yank_history.yank_history({ initial_mode = "normal" })
				end,
				desc = "Open Yank History",
				mode = { "n", "v" },
			},
			{ "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank Text" },
			{ "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put Yanked Text After Cursor" },
			{ "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put Yanked Text Before Cursor" },
		},
		config = function()
			local utils = require("yanky.utils")
			local mapping = require("yanky.telescope.mapping")
			require("yanky").setup({
				telescope = {
					mappings = {
						default = mapping.put("p"),
						i = {
							["<c-g>"] = mapping.put("p"),
							["<c-k>"] = mapping.put("P"),
							["<c-x>"] = mapping.delete(),
							["<c-r>"] = mapping.set_register(utils.get_default_register()),
							["<Tab>"] = mapping.move_selection_previous,
							["<S-Tab>"] = mapping.move_selection_next,
						},
						n = {
							p = mapping.put("p"),
							P = mapping.put("P"),
							d = mapping.delete(),
							r = mapping.set_register(utils.get_default_register()),
						},
					},
				},
				highlight = {
					on_put = true,
					on_yank = true,
					timer = 150,
				},
			})
		end,
	},
}
