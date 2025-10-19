local os = require("utils.system").get_os()

-- remeber the path you opened , i can cordinate back to it
_G.NVIM_INITIAL_PATH = vim.fn.expand("%:p:h")

-- 禁用 netrw（使用 Telescope 的文件浏览器替代）
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "
vim.g.mapdotleader = ","

-- 设置全局缩进为2个空格
vim.opt.tabstop = 2 -- 1个Tab显示为2个空格
vim.opt.shiftwidth = 2 -- 自动缩进使用的空格数
vim.opt.softtabstop = 2 -- 编辑时Tab键插入的空格数
vim.opt.expandtab = true -- 将Tab转换为空格
vim.opt.smartindent = true
vim.opt.termguicolors = true

vim.opt.number = true -- show line numbers
vim.opt.relativenumber = true -- show relative line numbers

-- >>>>>>>>>>>>>>>>>>> code fold settings start<<<<<<<<<<<<<<<<<<<
vim.opt.foldenable = true
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99
vim.opt.foldtext = "..."
-- >>>>>>>>>>>>>>>>>>> code fold settings end<<<<<<<<<<<<<<<<<<<
-- copy system settings
if os == "windows" then
	vim.opt.clipboard = "unamed"
else
	vim.opt.clipboard = "unnamedplus"
end
