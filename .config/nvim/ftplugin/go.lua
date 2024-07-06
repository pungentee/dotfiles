local map = vim.keymap.set

map("n", "<leader>vj", "<cmd>GoTagAdd json<cr>", { desc = "Add json tags to struct", silent = true, buffer = 0 })
map("n", "<leader>vy", "<cmd>GoTagAdd json<cr>", { desc = "Add yaml tags to struct", silent = true, buffer = 0 })
map("n", "<leader>vm", "<cmd>GoMod tidy<cr>", { desc = "Run go mod tidy", silent = true, buffer = 0 })
map("n", "<leader>vi", "<cmd>GoImpl<cr>", { desc = "Implement interface", silent = true, buffer = 0 })
map("n", "<leader>ve", "<cmd>GoIfErr<cr>", { desc = "Generate if err", silent = true, buffer = 0 })
