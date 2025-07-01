-- 加载检查模块
local check_keys = require("check_keymaps")

-- 绑定到 <leader>? （可自定义）
vim.keymap.set("n", "<leader>?", check_keys.interactive_check, {
  desc = "检查快捷键冲突"
})

vim.keymap.set("i", "jk", "<C-j>", { desc = "exit edit mode" })
