-- 安装 nvim-transparent
return {
  "xiyaowong/nvim-transparent",
  config = function()
    require("transparent").setup({
      extra_groups = { "NormalFloat", "NvimTreeNormal" }  -- 浮动窗口也透明
    })
  end
}
