vim.g.mapleader = " "

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.no_plugin_maps = 1

local opt = vim.opt

opt.autowrite = true

if not vim.env.SSH_TTY then
	opt.clipboard = "unnamedplus"
end

opt.completeopt = "menu,menuone,noselect"
opt.confirm = true
opt.cursorline = true
opt.expandtab = true
opt.ignorecase = true
opt.laststatus = 3
opt.mouse = "a"
opt.number = true
opt.pumblend = 10
opt.pumheight = 10
opt.scrolloff = 4
opt.shiftround = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.showmode = false
opt.sidescrolloff = 8
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "screen"
opt.tabstop = 4
opt.termguicolors = true
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200
opt.virtualedit = "block"
opt.winminwidth = 5
opt.wrap = false
opt.hlsearch = false
opt.shell = "/bin/bash"
-- opt.relativenumber = true

vim.g.float_file_tree = true
vim.g.tmux_navigator_disable_when_zoomed = 1

require("pungentee.lazy")
require("pungentee.autocmd")
require("pungentee.keys")
