opts = {
  padding = true,
  sticky = true,
  
  -- 智能注释字符串（支持JSX、Vue等）
  pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),

  -- 键位映射
  toggler = {
    line = "gcc",
    block = "gbc",
  },
  opleader = {
    line = "gc",
    block = "gb",
  },
  
  -- 文件类型特定配置
  mappings = {
    basic = true,    -- 启用基础映射
    extra = true,    -- 启用额外映射
    extended = false,-- 禁用扩展映射
  },
}
require("Comment").setup(opts)
