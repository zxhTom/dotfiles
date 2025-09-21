local function safe_cmd(cmd, error_msg)
	local ok, err = pcall(vim.cmd, cmd)
	if not ok then
		vim.notify(error_msg .. ": " .. err, vim.log.levels.ERROR)
	end
end

vim.keymap.set("n", "<leader>qn", function()
	safe_cmd("q", "Exit Issue")
end, { desc = "Quit current window" })
-- use safe_cmd can execute smoothly
vim.keymap.set("n", "<leader>qa", ":qall<CR>", { desc = "Quit current window" })
vim.keymap.set("i", "jk", "<esc>", { desc = "exit edit mode" })

vim.keymap.set("n", "<leader>qe", vim.diagnostic.open_float, { desc = "显示诊断信息" })

vim.keymap.set("n", "<leader>sh", function()
	safe_cmd("split", "horizaontally")
end, { desc = "[S]plit [H]orizaontally" })
vim.keymap.set("n", "<leader>sv", "<CMD>vsplit<CR>", { desc = "[VS]plit [H]orizaontally" })

-- 带描述的映射
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', { desc = 'Previous buffer' })

-- 快速跳转到首尾
vim.keymap.set('n', '<leader>bf', ':bfirst<CR>', { desc = 'First buffer' })
vim.keymap.set('n', '<leader>bl', ':blast<CR>', { desc = 'Last buffer' })
-- 如果到达最后一个buffer，自动回到第一个
vim.cmd([[
  function! CircularNext()
    let bufnr = bufnr('%')
    bnext
    if bufnr == bufnr('%')
      bfirst
    endif
  endfunction

  function! CircularPrev()  
    let bufnr = bufnr('%')
    bprevious
    if bufnr == bufnr('%')
      blast
    endif
  endfunction
]])

vim.keymap.set('n', '<A-l>', ':call CircularNext()<CR>')
vim.keymap.set('n', '<A-h>', ':call CircularPrev()<CR>')
