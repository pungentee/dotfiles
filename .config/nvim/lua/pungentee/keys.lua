local map = vim.keymap.set

-- speed up movement
map("n", "J", "15j")
map("n", "K", "15k")
map("v", "J", "15j")
map("v", "K", "15k")
map("n", "H", "15h")
map("n", "L", "15l")
map("v", "H", "15h")
map("v", "L", "15l")

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>nohlsearch<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- lazy
map("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy.nvim" })
