-- 限制运行时路径
vim.opt.rtp:append('/Users/zxhtom/.vscode/extensions/asvetliakov.vscode-neovim-1.18.22/runtime/')

vim.o.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  command = "checktime",
})

-- require('core.autocmds')
local loader = require "utils.config_loader"
local opts, loaded_keyboards = loader.load_configs("core.autocmds")

vim.cmd.colorscheme("catppuccin") -- 直接启用主题

