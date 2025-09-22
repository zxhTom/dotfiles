-- set keymappings
-- Echo translation in the cmdline
--[[ vim.api.nvim_set_keymap("n", "<leader>tt", ":Translate<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>tt", ":Translate<CR>", { noremap = true, silent = true })
-- Display translation in a window
vim.api.nvim_set_keymap("n", "<leader>tw", ":TranslateW<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>tw", ":TranslateW<CR>", { noremap = true, silent = true })
-- Replace the text with translation
vim.api.nvim_set_keymap("n", "<leader>tr", ":TranslateR<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>tr", ":TranslateR<CR>", { noremap = true, silent = true })
-- Translate the text in clipboard
vim.api.nvim_set_keymap("v", "<leader>tx", ":Translate<CR>", { noremap = true, silent = true }) ]]

local map = vim.keymap.set

-- 翻译光标下的单词到中文
map({ "n" }, "<leader>tc", "viw<Cmd>Translate zh<cr>", { desc = "翻译当前单词到中文" })
-- 翻译可视选区到中文
map({ "v" }, "<leader>tc", ":'<,'>Translate zh<cr>", { desc = "翻译选中内容到中文" })
-- 翻译光标下单词到英文
map({ "n" }, "<leader>te", "viw<Cmd>Translate en<cr>", { desc = "翻译当前单词到英文" })
-- 翻译可视选区到英文
map({ "v" }, "<leader>te", ":'<,'>Translate en<cr>", { desc = "翻译选中内容到中文" })

-- 翻译光标下的单词到中文
map({ "n" }, "<leader>trc", "viw<Cmd>Translate zh -output=replace<cr>", { desc = "翻译当前单词到中文" })
-- 翻译可视选区到中文
map({ "v" }, "<leader>trc", ":'<,'>Translate zh -output=replace<cr>", { desc = "翻译选中内容到中文" })
-- 翻译光标下单词到英文
map({ "n" }, "<leader>tre", "viw<Cmd>Translate en -output=replace<cr>", { desc = "翻译当前单词到英文" })
-- 翻译可视选区到英文
map({ "v" }, "<leader>tre", ":'<,'>Translate en -output=replace<cr>", { desc = "翻译选中内容到中文" })

-- 翻译光标下的单词到中文
map({ "n" }, "<leader>tpc", "viw<Cmd>Translate zh -output=register", { desc = "翻译当前单词到中文" })
-- 翻译可视选区到中文
map({ "v" }, "<leader>tpc", ":'<,'>Translate zh -output=register<cr>", { desc = "翻译选中内容到中文" })
-- 翻译光标下单词到英文
map({ "n" }, "<leader>tpe", "viw<Cmd>Translate en -output=register", { desc = "翻译当前单词到英文" })
-- 翻译可视选区到英文
map({ "v" }, "<leader>tpe", ":'<,'>Translate en -output=register<cr>", { desc = "翻译选中内容到中文" })
