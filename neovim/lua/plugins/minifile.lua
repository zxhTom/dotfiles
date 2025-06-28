return{ 
  'echasnovski/mini.files', 
  version = '*' ,
  enabled = true,
  lazy=false,
  config = function()
    require'utils.import'.all('minifile')
    -- require("config.minifile")
    -- require("keyboards.minifile")
  end
}
