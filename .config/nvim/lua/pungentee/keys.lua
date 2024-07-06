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

-- move lines
map("n", "<a-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map("n", "<a-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map("i", "<a-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<a-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<a-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map("v", "<a-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

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
