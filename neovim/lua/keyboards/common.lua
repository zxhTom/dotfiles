local function safe_cmd(cmd, error_msg)
  local ok, err = pcall(vim.cmd, cmd)
  if not ok then
    vim.notify(error_msg .. ": " .. err, vim.log.levels.ERROR)
  end
end

vim.keymap.set("n", "<leader>qn", function() safe_cmd("q","Exit Issue") end, { desc = "Quit current window" })
-- use safe_cmd can execute smoothly 
vim.keymap.set("n", "<leader>qa", ":qall<CR>", { desc = "Quit current window" })
vim.keymap.set("i", "jk", "<esc>", { desc = "exit edit mode" })

vim.keymap.set("n", "<leader>qe", vim.diagnostic.open_float, { desc = "显示诊断信息" })
