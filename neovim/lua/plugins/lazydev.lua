return {
	"folke/lazydev.nvim",
	ft = "lua", -- 仅在 lua 文件加载
	opts = {
		-- 你的配置（可选）
	},
	config = function()
		require("utils.import").all("lazydev")
	end,
}
