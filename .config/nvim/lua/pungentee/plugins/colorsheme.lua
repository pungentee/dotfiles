return {
	-- {
	-- 	"catppuccin/nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	init = function()
	-- 		require("catppuccin").setup({
	-- 			-- transparent_background = true,
	-- 			background = {
	-- 				light = "latte",
	-- 				dark = "mocha",
	-- 			},
	-- 			no_italic = true,
	-- 			no_bold = true,
	-- 			no_underline = true,
	-- 		})
	-- 		vim.o.background = "dark"
	-- 		vim.cmd.colorscheme("catppuccin")
	-- 	end,
	-- },

	-- {
	-- 	"f-person/auto-dark-mode.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	init = function()
	-- 		require("github-theme").setup({
	-- 			options = {
	-- 				-- transparent = true,
	-- 			},
	-- 		})
	--
	-- 		vim.o.background = "light"
	-- 		vim.cmd.colorscheme("github_light")
	-- 	end,
	-- },
	--

	{
		"nyoom-engineering/oxocarbon.nvim",
		lazy = false,
		priority = 1000,
		init = function()
			vim.o.background = "dark"
			vim.cmd.colorscheme("oxocarbon")
		end,
	},
}
