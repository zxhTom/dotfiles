-- 文件搜索
vim.keymap.set("n", "<dotleader>ff", "<cmd>Files<cr>", { desc = "FZF: Find Files" })
vim.keymap.set("n", "<dotleader>fg", "<cmd>GFiles<cr>", { desc = "FZF: Git Files" })
vim.keymap.set("n", "<dotleader>fb", "<cmd>Buffers<cr>", { desc = "FZF: Buffers" })

-- 内容搜索
vim.keymap.set("n", "<dotleader>fs", "<cmd>Rg<cr>", { desc = "FZF: Search Text" })
vim.keymap.set("n", "<dotleader>fl", "<cmd>Lines<cr>", { desc = "FZF: Lines in Buffer" })
vim.keymap.set("n", "<dotleader>fw", "<cmd>BLines<cr>", { desc = "FZF: Lines in Current Buffer" })

-- 其他搜索
vim.keymap.set("n", "<dotleader>fc", "<cmd>Commands<cr>", { desc = "FZF: Commands" })
vim.keymap.set("n", "<dotleader>fh", "<cmd>History<cr>", { desc = "FZF: History" })
vim.keymap.set("n", "<dotleader>fm", "<cmd>Maps<cr>", { desc = "FZF: Key Maps" })
vim.keymap.set("n", "<dotleader>ft", "<cmd>Filetypes<cr>", { desc = "FZF: Filetypes" })
