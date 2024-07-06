return {
	{
		"nvim-tree/nvim-tree.lua",
		event = "VimEnter",
		dependencies = {
			"Allianaab2m/nvim-material-icon-v3",
		},
		keys = { { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "File explorer", nowait = true } },
		config = function()
			local HEIGHT_RATIO = 0.7
			local WIDTH_RATIO = 0.7

			local view = (function()
				if vim.g.float_file_tree then
					return {
						float = {
							enable = true,
							open_win_config = function()
								local screen_w = vim.opt.columns:get()
								local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
								local window_w = screen_w * WIDTH_RATIO
								local window_h = screen_h * HEIGHT_RATIO
								local window_w_int = math.floor(window_w)
								local window_h_int = math.floor(window_h)
								local center_x = (screen_w - window_w) / 2
								local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
								return {
									border = "rounded",
									relative = "editor",
									row = center_y,
									col = center_x,
									width = window_w_int,
									height = window_h_int,
								}
							end,
						},
						width = function()
							return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
						end,
					}
				else
					vim.api.nvim_create_autocmd({ "VimEnter" }, {
						callback = function(data)
							local real_file = vim.fn.filereadable(data.file) == 1

							if not real_file then
								return
							end

							require("nvim-tree.api").tree.toggle({ focus = false, find_file = true })
						end,
					})

					return {
						width = 40,
					}
				end
			end)()

			require("nvim-web-devicons").setup({
				override = require("nvim-material-icon").get_icons(),
			})

			require("nvim-tree").setup({
				view = view,
				renderer = {
					indent_width = 4,
					icons = {
						show = {
							git = false,
						},
					},
				},
				actions = {
					open_file = {
						window_picker = {
							enable = false,
						},
					},
				},
			})

			local api = require("nvim-tree.api")
			api.events.subscribe(api.events.Event.FileCreated, function(file)
				vim.cmd("edit " .. file.fname)
			end)
		end,
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
				nowait = true,
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
		opts = {
			jump = {
				autojump = true,
			},
			modes = {
				char = {
					enabled = false,
				},
			},
		},
	},
	{
		"folke/trouble.nvim",
		event = "VeryLazy",
		keys = {
			{
				"<leader>dd",
				"<cmd>Trouble diagnostics toggle focus=true win.position=right<cr>",
				desc = "Toggle diagnostics window",
			},
			{
				"<leader>db",
				"<cmd>Trouble diagnostics toggle filter.buf=0 win.position=right<cr>",
				desc = "Toggle buffer Diagnostics window",
			},
			{
				"<leader>df",
				"<cmd>Trouble focus win.position=right<cr>",
				desc = "Focus diagnostic window",
			},
			{
				"<leader>s",
				"<cmd>Trouble symbols toggle focus=true win.position=right<cr>",
				desc = "Toggle symbols window",
			},
		},
		opts = {
			auto_close = true,
		},
	},
	{
		"folke/todo-comments.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"folke/trouble.nvim",
		},
		keys = {
			{ "<leader>dt", "<cmd>TodoTrouble<cr>", desc = "Todo list" },
		},
		opts = {},
	},
	{
		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "xiyaowong/telescope-emoji.nvim" },
		},
		keys = {
			{
				"<leader>ff",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Find files",
			},
			{
				"<leader>fs",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "Find string",
			},
			{
				"<leader>ft",
				function()
					require("telescope.builtin").treesitter()
				end,
				desc = "Find sctuctures",
			},
			{
				"<leader>fe",
				"<cmd>Telescope emoji<cr>",
				desc = "Find emoji",
			},
		},
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				defaults = {
					mappings = {
						n = {
							["q"] = require("telescope.actions").close,
						},
						i = {
							["jk"] = require("telescope.actions").close,
							["<Tab>"] = require("telescope.actions").move_selection_previous,
							["<S-Tab>"] = require("telescope.actions").move_selection_next,
						},
					},
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})

			telescope.load_extension("ui-select")
			telescope.load_extension("fzf")
			telescope.load_extension("noice")
			telescope.load_extension("emoji")
		end,
	},
	-- {
	-- 	"supermaven-inc/supermaven-nvim",
	-- 	keys = {
	-- 		{
	-- 			"<leader>t",
	-- 			function()
	-- 				require("supermaven-nvim.api").toggle()
	-- 			end,
	-- 			desc = "Toggle Supermaven",
	-- 		},
	-- 	},
	-- 	config = function()
	-- 		require("supermaven-nvim").setup({
	-- 			disable_inline_completion = true,
	-- 			disable_keymaps = true,
	-- 		})
	--
	-- 		require("supermaven-nvim.api").stop()
	-- 	end,
	-- },
	-- {
	-- 	"andweeb/presence.nvim",
	-- 	event = "VeryLazy",
	-- 	opts = {
	-- 		main_image = "file",
	-- 	},
	-- },
	{
		"folke/persistence.nvim",
		event = { "BufReadPre", "VeryLazy" },
		config = true,
	},
	{
		"toppair/peek.nvim",
		event = "VeryLazy",
		build = "deno task --quiet build:fast",
		keys = {
			{
				"<leader>mo",
				function()
					require("peek").open()
				end,
				desc = "Open markdown preview",
			},
			{
				"<leader>mc",
				function()
					require("peek").close()
				end,
				desc = "Close markdown preview",
			},
		},
		config = true,
	},
	{
		"Pocco81/auto-save.nvim",
		opts = {
			trigger_events = { "InsertLeave" }, -- vim events that trigger auto-save. See :h events
		},
	},
}
