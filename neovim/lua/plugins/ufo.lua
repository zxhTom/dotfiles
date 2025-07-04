return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
		{
			"luukvbaal/statuscol.nvim", -- 可选：状态栏增强
			config = function()
				require("statuscol").setup({
					foldfunc = "builtin",
					setopt = true,
				})
			end,
		},
	},
	event = "VeryLazy", -- 更彻底的延迟加载
	opts = {},
	config = function()
		require("utils.import").all("ufo")
	end,
}
