local loader = require "utils.config_loader"
local opts, loaded_keyboards = loader.load_configs("keyboards")
-- print("Loaded mappings:", vim.inspect(loaded_keyboards))
  -- 显式传递正确的 bufnr
require("astrocore").setup {
  on_attach = function(client, bufnr)
    vim.diagnostic.enable(bufnr)  -- 确保 bufnr 是数字
  end,
}
return opts
