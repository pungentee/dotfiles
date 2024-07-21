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
				filters = {
					dotfiles = false,
					git_ignored = false,
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
		"folke/todo-comments.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		keys = {
			{ "<leader>fa", "<cmd>TodoTelescope<cr>", desc = "Find TODOs" },
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
			{
				"<leader>fd",
				function()
					require("telescope.builtin").diagnostics()
				end,
				desc = "Find diagnostic",
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
							["<S-Tab>"] = require("telescope.actions").move_selection_previous,
							["<Tab>"] = require("telescope.actions").move_selection_next,
						},
					},
					layout_strategy = "horizontal",
					layout_config = {
						horizontal = {
							prompt_position = "top",
						},
					},
					sorting_strategy = "ascending",
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
	-- 	config = fu
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
		keys = {
			{
				"<leader>s",
				function()
					require("persistence").load()
				end,
				desc = "Restore session",
			},
		},
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
			trigger_events = { "InsertLeave" },
		},
	},
	{
		"gbprod/yanky.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		keys = {
			{ "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank Text" },
			{ "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put Yanked Text After Cursor" },
			{ "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put Yanked Text Before Cursor" },
		},
		config = function()
			require("yanky").setup({
				highlight = {
					on_put = true,
					on_yank = true,
					timer = 150,
				},
			})
		end,
	},
	{
		"f-person/git-blame.nvim",
		event = "VeryLazy",
		keys = {
			{ "<leader>gb", "<cmd>GitBlameToggle<cr>", desc = "Toggle blame" },
		},
		config = function()
			require("gitblame").setup({ enabled = false })
			vim.g.gitblame_message_template = "<author> / <date> / <summary>"
			vim.g.gitblame_display_virtual_text = 0
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		keys = {
			{ "<leader>gs", "<cmd>Gitsigns toggle_signs<cr>", desc = "Toggle sing column" },
		},
		config = function()
			require("gitsigns").setup({
				signcolumn = false,
			})
		end,
	},
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
}
