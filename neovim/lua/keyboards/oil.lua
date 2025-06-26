-- 绑定 <leader>e 打开/关闭 Oil
vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Toggle Oil file explorer" })

-- 可选：绑定 <leader>E 在浮动窗口打开
vim.keymap.set("n", "<leader>E", function()
  require("oil").toggle_float()
end, { desc = "Toggle Oil in float" })
