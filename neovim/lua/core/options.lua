local os = require'utils.system'.get_os()
-- 禁用 netrw（使用 Telescope 的文件浏览器替代）
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "
-- 设置全局缩进为2个空格
vim.opt.tabstop = 2       -- 1个Tab显示为2个空格
vim.opt.shiftwidth = 2    -- 自动缩进使用的空格数
vim.opt.softtabstop = 2   -- 编辑时Tab键插入的空格数
vim.opt.expandtab = true  -- 将Tab转换为空格
print("eee")
if os == 'windows' then
  vim.opt.clipboard='unamed'
else
  vim.opt.clipboard='unnamedplus'
end
