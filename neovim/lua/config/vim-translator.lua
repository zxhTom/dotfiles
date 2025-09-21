require("translate").setup({
	default = {
		command = "google", -- 默认翻译引擎：google / deepl / libre
		output = "floating", -- 输出窗口样式：floating / split / replace
	},
	-- 自定义翻译命令
	-- 比如 'translate_zh' 命令翻译成中文
	preset = {
		translate_en = {
			command = "google",
			args = { "-t", "en" },
		},
		translate_zh = {
			command = "google",
			args = { "-t", "zh-CN" },
		},
	},
})
