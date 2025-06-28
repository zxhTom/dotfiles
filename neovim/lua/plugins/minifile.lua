return{ 
  'echasnovski/mini.files', 
  version = '*' ,
  enabled = true,
  config = function()
    require('mini.files').setup({
    })
  end
}
