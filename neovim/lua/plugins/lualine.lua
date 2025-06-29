return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('utils.import').all("lualine")
    end,
    enabled = toms.plugins.lualine.enabled or false
  }
}
