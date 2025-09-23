-- markdown check list choose
-- 切换 Checklist 状态
function _G.toggle_checkbox()
	local line = vim.api.nvim_get_current_line()
	if line:match("%- %[ %]") then
		local nl = line:gsub("%[ %]", "[x]")
		vim.api.nvim_set_current_line(nl)
	elseif line:match("%- %[x%]") then
		local nl = line:gsub("%[x%]", "[ ]")
		vim.api.nvim_set_current_line(nl)
	end
end

-- 绑定快捷键
vim.keymap.set("n", "<leader>tf", "<cmd>lua toggle_checkbox()<CR>", { desc = "Toggle checkbox" })
-- 插入新检查项
vim.keymap.set("n", "<leader>ic", "o- [ ] ", { desc = "Insert checklist item" })
