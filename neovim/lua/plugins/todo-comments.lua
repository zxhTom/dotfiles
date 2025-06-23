return {
  'folke/todo-comments.nvim',
  dependencies = {'nvim-lua/plenary.nvim'},
  config = function()
    require('todo-comments').setup {
      -- TODO: hello
      -- BUG: nnnnn
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}
