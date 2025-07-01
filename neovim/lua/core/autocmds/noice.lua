vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    if not toms.plugins.noice.cmdline.enabled then
      vim.opt.cmdheight = 1  -- 强制覆盖所有插件的修改
      vim.opt.showcmd = true
      vim.cmd("redraw!")     -- 立即刷新界面
      vim.cmd("redraw!")
      vim.cmd("mode")
      vim.notify("cmdheight 已锁定为 1", vim.log.levels.INFO)
    end
  end,
})
