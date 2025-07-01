local M = {}

-- 交互式检测入口
function M.interactive_check()
  vim.ui.input({
    prompt = "输入要检测的快捷键 (如 <leader>ff): ",
    default = "",
  }, function(input)
    if not input or input == "" then return end

    local conflicts = M.generate_conflict_report(input)
    if #conflicts == 0 then
      vim.notify("✅ 快捷键 '" .. input .. "' 无冲突", vim.log.levels.INFO)
    else
      local msg = { "⚠️ 冲突发现 (" .. input .. "):" }
      for _, conflict in ipairs(conflicts) do
        table.insert(msg, string.format(
          "[%s模式] 共 %d 处定义:",
          conflict.mode, #conflict.definitions
        ))
        for i, def in ipairs(conflict.definitions) do
          table.insert(msg, string.format(
            "  %d. %s -> %s | 来源: %s",
            i, def.lhs, def.rhs, def.source
          ))
        end
      end
      vim.notify(vim.inspect(msg), vim.log.levels.WARN, {
        title = "快捷键冲突",
        timeout = 8000,  -- 延长显示时间
      })
    end
  end)
end

-- 获取当前所有已加载的快捷键（仅最终生效的）
function M.get_current_keymaps(key)
	local modes = { "n", "i", "v", "x", "s", "o", "t" }
	local current_maps = {}
	for _, mode in ipairs(modes) do
		for _, map in ipairs(vim.api.nvim_get_keymap(mode)) do
      if not key or map.lhs == key then
        table.insert(current_maps, {
          mode = mode,
          lhs = map.lhs,
          rhs = map.rhs or (map.callback and "Lua函数" or "未知"),
          desc = map.desc or "无描述",
          source = "运行时加载",
        })
      end
		end
	end
	return current_maps
end

-- 检测冲突并生成报告
function M.generate_conflict_report(key)
	local current_maps = M.get_current_keymaps(key) -- 当前生效的快捷键
	local config_maps = M.scan_lua_configs(key) -- 所有配置文件中的快捷键

	-- 合并所有快捷键（包括被覆盖的）
	local all_maps = {}
	for _, map in ipairs(config_maps) do
		table.insert(all_maps, map)
	end
	for _, map in ipairs(current_maps) do
		table.insert(all_maps, map)
	end

	-- 检测冲突（相同的 mode + lhs 出现多次）
	local conflict_map = {}
	for _, map in ipairs(all_maps) do
		local key = map.mode .. "::" .. map.lhs
		if not conflict_map[key] then
			conflict_map[key] = {}
		end
		table.insert(conflict_map[key], map)
	end

	-- 提取真正的冲突项（同一个快捷键被多次定义）
	local conflicts = {}
	for key, maps in pairs(conflict_map) do
		if #maps > 1 then
			table.insert(conflicts, {
				key = key:match("::(.+)"),
				mode = key:match("(.+)::"),
				definitions = maps,
			})
		end
	end

	return conflicts
end

-- 显示冲突报告
function M.show_conflict_report()
	local conflicts = M.generate_conflict_report()

	if #conflicts == 0 then
		vim.notify("✅ 未检测到快捷键冲突", vim.log.levels.INFO)
		return
	end

	-- 在浮动窗口中显示冲突
	local buf = vim.api.nvim_create_buf(false, true)
	local lines = { "# 快捷键冲突报告（包括被覆盖的冲突）", "" }

	for _, conflict in ipairs(conflicts) do
		table.insert(
			lines,
			string.format(
				"## [%s模式] 快捷键: %s (共 %d 处定义)",
				conflict.mode,
				conflict.key,
				#conflict.definitions
			)
		)

		for i, def in ipairs(conflict.definitions) do
			table.insert(
				lines,
				string.format("%d. 映射为: %s | 描述: %s | 来源: %s", i, def.rhs, def.desc, def.source)
			)
		end
		table.insert(lines, "")
	end

	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
	vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		title = " 快捷键冲突报告 ",
		border = "rounded",
		width = math.min(80, vim.o.columns - 10),
		height = math.min(20, vim.o.lines - 10),
		col = (vim.o.columns - math.min(80, vim.o.columns - 10)) / 2, -- 居中
		row = (vim.o.lines - math.min(20, vim.o.lines - 10)) / 2,
		style = "minimal",
	})
	-- 绑定快捷键：q 退出，<leader>y 复制报告
	vim.keymap.set("n", "q", "<cmd>q!<CR>", { buffer = buf, desc = "退出" })
	vim.keymap.set("n", "<leader>y", function()
		vim.fn.setreg("+", table.concat(lines, "\n"))
		vim.notify("冲突报告已复制到剪贴板", vim.log.levels.INFO)
	end, { buffer = buf, desc = "复制报告" })
end

function M.scan_lua_configs(key)
	local config_dir = vim.fn.stdpath("config") .. "/lua"
	local keymaps = {}

	-- 使用 plenary.nvim 扫描文件
	local scan = require("plenary.scandir").scan_dir
	local files = scan(config_dir, { depth = 3, search_pattern = "%.lua$" })

	for _, file in ipairs(files) do
		local content = table.concat(vim.fn.readfile(file), "\n")

		-- 增强匹配规则：支持 `vim.keymap.set` 和 `map.set`（别名）
		for line in content:gmatch("[^\n]+") do
			-- 匹配标准写法：vim.keymap.set("mode", "lhs", ...)
			for mode, lhs, rhs, opts in
				line:gmatch(
					"vim%.keymap%.set%(%s*[\"']([niovxst])[\"']%s*,%s*[\"']([^\"']+)[\"']%s*,%s*([^,]+)%s*,%s*({[^}]*})"
				)
			do
        if not key or lhs==key then
          local desc = opts:match("desc%s*=%s*['\"]([^'\"]+)['\"]")
          table.insert(keymaps, {
            mode = mode,
            lhs = lhs,
            rhs = rhs:gsub("^%s*(.-)%s*$", "%1"),
            desc = desc or "无描述",
            source = file .. " (标准写法)",
          })
        end
			end

			-- 匹配别名写法：map.set("mode", "lhs", ...)
			for alias, mode, lhs, rhs, opts in
				line:gmatch(
					"(?!vim%.keymap%)%.set%(%s*[\"']([niovxst])[\"']%s*,%s*[\"']([^\"']+)[\"']%s*,%s*([^,]+)%s*,%s*({[^}]*})"
				)
			do
				local desc = opts:match("desc%s*=%s*['\"]([^'\"]+)['\"]")
				table.insert(keymaps, {
					mode = mode,
					lhs = lhs,
					rhs = rhs:gsub("^%s*(.-)%s*$", "%1"),
					desc = desc or "无描述",
					source = file .. " (别名写法: " .. alias .. ".set)",
				})
			end
		end
	end

	return keymaps
end

return M
