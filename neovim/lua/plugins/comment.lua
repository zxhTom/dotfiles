return {
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring", -- 智能上下文注释
    },
    config = function(_, opts)
      require "utils.import".all("comment")
    end,
  },
  
  -- 上下文注释字符串支持
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "VeryLazy",
    opts = {
      enable_autocmd = false,
    },
  },
}
