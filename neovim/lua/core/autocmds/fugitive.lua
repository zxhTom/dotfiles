-- 自动关闭帮助窗口
vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = "fugitive",
	callback = function()
		vim.opt_local.buflisted = false
		vim.keymap.set("n", "q", "<cmd>q<cr>", { buffer = true, desc = "Quit" })
		vim.keymap.set("n", "<esc>", "<cmd>q<cr>", { buffer = true, desc = "Quit" })
	end,
})

-- 在状态栏显示 git 信息
vim.api.nvim_create_autocmd("User", {
	group = augroup,
	pattern = "FugitiveIndex",
	callback = function()
		if vim.fn.exists("$GIT_DIR") == 1 then
			vim.opt.statusline = vim.opt.statusline .. " %{fugitive#statusline()}"
		end
	end,
})
