require("ufo").setup({
	close_fold_kinds = { "imports" }, -- 默认关闭 imports 折叠
	open_fold_hl_timeout = 400,
	preview = {
		win_config = {
			border = "rounded", -- 预览窗口边框样式
			winhighlight = "Normal:Folded",
			winblend = 0,
		},
		mappings = {
			scrollU = "<C-u>",
			scrollD = "<C-d>",
		},
	},
	provider_selector = function(bufnr, filetype, buftype)
		local ftMap = {
			python = { "indent" }, -- 对 Python 只用缩进折叠
			git = "", -- 对 git 文件禁用折叠
			_ = { "treesitter", "indent" }, -- 默认配置
		}
		return ftMap[filetype] or ftMap["_"]
	end,
})
