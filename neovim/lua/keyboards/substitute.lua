-- Lua
vim.keymap.set("n", "<leader>s", require('substitute').operator, { noremap = true })
vim.keymap.set("n", "<leader>ss", require('substitute').line, { noremap = true })
vim.keymap.set("n", "<leader>S", require('substitute').eol, { noremap = true })
vim.keymap.set("x", "<leader>s", require('substitute').visual, { noremap = true })

vim.keymap.set("n", "<leader>sr", require('substitute.range').operator, { noremap = true })
vim.keymap.set("x", "<leader>sr", require('substitute.range').visual, { noremap = true })
vim.keymap.set("n", "<leader>ssr", require('substitute.range').word, { noremap = true })

vim.keymap.set("n", "<leader>sx", require('substitute.exchange').operator, { noremap = true })
vim.keymap.set("n", "<leader>sxx", require('substitute.exchange').line, { noremap = true })
vim.keymap.set("x", "<leader>X", require('substitute.exchange').visual, { noremap = true })
vim.keymap.set("n", "<leader>sxc", require('substitute.exchange').cancel, { noremap = true })
