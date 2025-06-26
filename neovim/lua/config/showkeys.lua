keys = require("showkeys")
keys.setup({
  timeout = 1,
  maxkeys = 6,
})
-- effect auto  , this will execute once , it will be failed if this plugins loaded not complete
vim.cmd("ShowkeysToggle")

-- it will execute when the plugins loaded completely completed
--[[
vim.schedule(function()
  vim.cmd("ShowkeysToggle")
end)
--]]
