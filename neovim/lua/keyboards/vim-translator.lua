-- set keymappings
-- Echo translation in the cmdline
vim.api.nvim_set_keymap('n', '<leader>tt', ":Translate<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>tt', ":Translate<CR>", { noremap = true, silent = true })
-- Display translation in a window
vim.api.nvim_set_keymap('n', '<leader>tw', ":TranslateW<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>tw', ":TranslateW<CR>", { noremap = true, silent = true })
-- Replace the text with translation
vim.api.nvim_set_keymap('n', '<leader>tr', ":TranslateR<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>tr', ":TranslateR<CR>", { noremap = true, silent = true })
-- Translate the text in clipboard
vim.api.nvim_set_keymap('v', '<leader>tx', ":Translate<CR>", { noremap = true, silent = true })
