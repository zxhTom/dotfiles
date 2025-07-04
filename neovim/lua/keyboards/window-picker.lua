vim.keymap.set("n", "<leader>wp", function()
  local picked_window_id = require("window-picker").pick_window({
    hint = "floating-big-letter",
  })
  if picked_window_id then
    vim.api.nvim_set_current_win(picked_window_id) -- 跳转到选中的窗口
    -- 这里可以追加其他操作，例如粘贴：
    local clipboard_content = vim.fn.getreg("+")
    print(clipboard_content)
    vim.api.nvim_paste(clipboard_content, true, -1)
  end
end, { desc = "Pick window and paste" })
