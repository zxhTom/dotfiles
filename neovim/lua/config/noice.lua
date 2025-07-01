-- 重置 Neovim 的原生输入函数（关键！）
-- vim.ui.input = function(opts, on_confirm)
-- 	local input = vim.fn.input(opts) -- 使用原生输入
-- 	if on_confirm then
-- 		on_confirm(input)
-- 	end
-- 	return input
-- end

-- 确保命令行区域可见
vim.opt.cmdheight = 1 -- 高度 ≥1
vim.opt.showcmd = true -- 显示输入命令
vim.opt.ruler = true -- 显示光标位置
-- hello world
require("noice").setup({
	cmdline = {
		enabled = toms.plugins.noice.cmdline.enabled, -- 启用命令行
		format = {
			cmdline = false,
		},
    view="cmdline_popup",
		opt = {
			filter = function(cmd)
				return vim.tbl_contains({ "verbose" }, cmd:match("^%s*(%S+)"))
			end,
		},
	},
	message = {
		enabled = true,
	},
	-- 启用消息节流
	throttle = 1000, -- 消息间隔至少1秒（单位：毫秒）
	-- 或针对特定事件：
	routes = {
		{
			filter = { event = "msg_show" },
			opts = { throttle = 500 }, -- 单独设置节流时间
		},
	},
	-- you can enable a preset for easier configuration
	presets = {
		bottom_search = true, -- use a classic bottom cmdline for search
		command_palette = false, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = false, -- add a border to hover docs and signature help
	},
})
