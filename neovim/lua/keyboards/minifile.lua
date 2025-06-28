local ok,minifiles = pcall(require,"mini.files")
-- 切换文件浏览器 (在 normal 模式)
vim.keymap.set('n', '<leader>E', function()
  if not MiniFiles.close() then
    -- MiniFiles.open(_G.NVIM_INITIAL_PATH)
    minifiles.open(_G.NVIM_INITIAL_PATH)
  end
end, { desc = 'Toggle file explorer' })
