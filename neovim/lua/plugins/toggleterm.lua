return {
  'akinsho/toggleterm.nvim', 
  version = "*", 
  config = function()
    require("config/toggleterm").config()
    require("config/toggleterm").setup()
  end,
}
