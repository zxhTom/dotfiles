return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		keywords = {
			-- 默认关键字
			TODO = { icon = " ", color = "info" },
			FIXME = { icon = " ", color = "error" },
			-- 添加 Markdown Checklist 支持
			CHECK = {
				pattern = [[.*%- %[ %].*]], -- 匹配 "- [ ]"
				icon = " ",
				color = "warning",
			},
			DONE = {
				pattern = [[.*%- %[x%].*]], -- 匹配 "- [x]"
				icon = " ",
				color = "error",
			},
		},
	},
	config = function(_, opts)
		-- local custom = {
    -- 	-- FIXME: nihao
    -- 	-- TODO: hello
		-- 	-- BUG: nnnnn
		-- 	-- your configuration comes here
		-- 	-- or leave it empty to use the default settings
		-- 	-- refer to the configuration section below
		-- }
		require("todo-comments").setup(opts)
	end,
}
