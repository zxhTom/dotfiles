return {
	-- fzf 本体（需要先安装）
	{
		"junegunn/fzf",
		build = "./install --bin",
		dependencies = { "junegunn/fzf.vim" },
	},

	-- fzf.vim 插件
	{
		"junegunn/fzf.vim",
		dependencies = { "junegunn/fzf" },
		config = function()
      require("utils.import").all("fzf")
		end,
	},

	-- fd 命令（系统级依赖，这里确保配置正确）
	{
		"sharkdp/fd",
		build = "cargo install fd-find", -- 如果使用 Rust 安装
		-- 或者使用系统包管理器安装
	},
}
