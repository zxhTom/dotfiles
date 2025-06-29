return{
  'gelguy/wilder.nvim',
  build = ":UpdateRemotePlugins",
  config = function()
    -- config goes here
    require('utils.import').all("wilder")
  end,
  enabled=toms.plugins.wilder.enabled or false,
}
