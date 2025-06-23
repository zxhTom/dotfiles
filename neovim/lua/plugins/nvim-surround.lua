return {
  "kylechui/nvim-surround",
  tag = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
  config = function()
    require "utils.import".all("nvim-surround")
  end,
}

