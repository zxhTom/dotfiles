return {
  "zxhTom/astrocore",
  branch = "feat/which-key-compatibility",
  lazy = false, -- disable lazy loading
  priority = 10000, -- load AstroCore first
  -- opts = require("config.astrocore"),
  config = function()
    require "utils.import".all("astrocore")
  end,
  enabled = toms.plugins.astrocore.enabled,
}
