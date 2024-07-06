return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		event = "VeryLazy",
		build = ":TSUpdate",
		dependencies = {
			-- {
			-- 	"nvim-treesitter/nvim-treesitter-context",
			-- 	opts = {
			-- 		max_lines = 1,
			-- 	},
			-- },
			{
				"windwp/nvim-ts-autotag",
				opts = {},
			},
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				highlight = {
					enable = true,
				},
				indent = {
					enable = true,
				},
				incremental_selection = {
					enable = true,
				},
				ensure_installed = {
					"bash",
					"vimdoc",
					"c",
					"cpp",
					"cmake",
					"diff",
					"html",
					"javascript",
					"jsdoc",
					"json",
					"jsonc",
					"lua",
					"luadoc",
					"markdown",
					"markdown_inline",
					"python",
					"query",
					"regex",
					"toml",
					"tsx",
					"typescript",
					"xml",
					"yaml",
					"go",
					"gomod",
					"gosum",
					"rust",
					"ron",
					"css",
					"dockerfile",
					"fish",
					"gitignore",
					"latex",
					"make",
					"julia",
					"nasm",
					"printf",
					"sql",
				},
			})
		end,
	},
}
