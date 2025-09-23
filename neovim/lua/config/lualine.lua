require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto", -- 自动根据 colorscheme 选择主题
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {}, -- 禁用特定文件类型的状态栏
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = {
			{
				function()
					local oil = require("oil")
					-- 情况1：当前是 oil 文件列表
					if vim.bo.filetype == "oil" then
							return vim.api.nvim_buf_get_name(0)
					-- 情况2：当前是普通文件，但通过 oil 打开
          else
						local bufname = vim.api.nvim_buf_get_name(0)
						-- 检查是否是真实文件（不是 oil:// 协议）
						if bufname ~= "" and not bufname:match("^oil://") then
							local filename = vim.fn.fnamemodify(bufname, ":t")
							local filetype = vim.bo.filetype
							local icon = "📄"

							-- 根据文件类型显示不同图标
							if filetype == "python" then
								icon = "🐍"
							elseif filetype == "javascript" then
								icon = "📜"
							elseif filetype == "typescript" then
								icon = "📘"
							elseif filetype == "lua" then
								icon = "🌙"
							elseif filetype == "html" then
								icon = "🌐"
							elseif filetype == "css" then
								icon = "🎨"
							elseif filetype == "json" then
								icon = "🔤"
							elseif filetype == "markdown" then
								icon = "📝"
							end

							return icon .. filename
						end
					end

				end,
				-- 添加颜色高亮
				color = { fg = "#89b4fa", gui = "bold" },
			},
		},
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {}, -- 可以配置标签栏显示
	extensions = {}, -- 可以加载扩展如 fugitive, nvim-tree 等
})
