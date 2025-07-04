local loader = require("utils.config_loader")
local opts, loaded_keyboards = loader.load_configs("keyboards")
-- 显式传递正确的 bufnr
local astrocore = require("astrocore")
if astrocore then
	astrocore.setup({
		opts = opts,
		on_attach = function(client, bufnr)
			vim.diagnostic.enable(bufnr) -- 确保 bufnr 是数字
		end,
	})
end
return opts
