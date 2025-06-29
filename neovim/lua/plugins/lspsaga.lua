return {
  "glepnir/lspsaga.nvim",
  event = "BufRead",
  config = function()
    require("lspsaga").setup({
      lightbulb = {
        enable = true,           -- 启用功能
        enable_in_insert = true, -- 插入模式也显示
        sign = true,             -- 显示图标
        sign_priority = 10,      -- 图标优先级
        virtual_text = false,    -- 不显示虚拟文本
      }
    })
  end,
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    --Please make sure you install markdown and markdown_inline parser
    { "nvim-treesitter/nvim-treesitter" }
  },
  enabled=toms.plugins["lspsaga"].enabled or false
}
