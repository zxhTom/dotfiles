return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function ()
   require('utils.import').all("bufferline") 
  end
}
