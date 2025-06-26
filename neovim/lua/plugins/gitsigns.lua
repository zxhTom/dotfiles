-- lazy.nvim 配置
return {
  "lewis6991/gitsigns.nvim",
  opts = {
    signs = {
      add = { text = "│" },
      change = { text = "│" },
    },
  },
  lazy=false,
  config = function()
    require'utils.import'.all("gitsigns")
  end
}
