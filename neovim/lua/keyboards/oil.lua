-- 快捷键跳回最初的打开目录
vim.keymap.set("n", "<leader>ob", function()
  require("oil").open(_G.NVIM_INITIAL_PATH)
end, { desc = "Oil: back to nvim entry path" })
-- 绑定 <leader>e 打开/关闭 Oil
vim.keymap.set("n", "<leader>b", "<CMD>Oil<CR>", { desc = "Toggle Oil file explorer" })

-- 可选：绑定 <leader>E 在浮动窗口打开
vim.keymap.set("n", "<leader>E", function()

  -- 必须执行的清理操作
  vim.schedule(function()
  -- 1. 重置命令行核心参数
  vim.opt.cmdheight = 1
  vim.opt.showcmd = true
  vim.opt.showmode = true

  -- 2. 清除 noice 注册的所有命令行相关自动命令
  for _, event in ipairs({"CmdlineEnter", "CmdlineLeave"}) do
    pcall(vim.api.nvim_clear_autocmds, { event = event, group = "noice" })
  end

  -- 3. 重置被修改的高亮组（关键步骤！）
  vim.api.nvim_set_hl(0, "MsgArea", { link = "Normal" })
  vim.api.nvim_set_hl(0, "ModeMsg", { link = "Identifier" })

  -- 4. 强制重绘界面
  vim.cmd("redrawstatus!")
  vim.cmd("redraw!")
  end)
  print("1---")
  print(vim.api.nvim_buf_get_name(0))
  print(vim.fn.expand("%:p"))
  print(vim.fn.getcwd())
  print(require("oil").get_current_dir())
  -- require("oil").toggle_float()
end, { desc = "Toggle Oil in float" })
