-- oil autocmd , theme settings
-- 在你的 init.lua 中添加
local function configure_oil_highlights()
  local colors = require("kanagawa.colors").setup()
  
  -- 定义辅助函数简化高亮组创建
  local function set_hl(name, opts)
    opts.default = true
    vim.api.nvim_set_hl(0, name, opts)
  end
  
  -- 强制设置 oil-git-status 相关高亮组
  set_hl("OilGitStatusSign", { fg = colors.sumiInk3, bg = "NONE" })
  set_hl("OilGitStatusLine", { bg = colors.sumiInk0 })
  set_hl("OilGitStatusAdded", { fg = colors.springGreen })
  set_hl("OilGitStatusModified", { fg = colors.autumnYellow })
  set_hl("OilGitStatusDeleted", { fg = colors.samuraiRed })
  set_hl("OilGitStatusRenamed", { fg = colors.boatBlue })
  set_hl("OilGitStatusUntracked", { fg = colors.springViolet1 })
  set_hl("OilGitStatusIgnored", { fg = colors.fujiGray })
  set_hl("OilGitStatusConflict", { fg = colors.peachRed })
  
  -- 覆盖 oil.nvim 原生高亮组确保一致性
  set_hl("OilDir", { fg = colors.waveAqua1, bold = true })
  set_hl("OilSymlink", { fg = colors.oniViolet })
  set_hl("OilHidden", { fg = colors.fujiGray })
end

-- 在主题加载后应用配置
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "kanagawa",
  callback = configure_oil_highlights,
})

-- 初始化时立即应用
if vim.g.colors_name == "kanagawa" then
  configure_oil_highlights()
end
