local Terminal = require('toggleterm.terminal').Terminal

-- 定义全屏终端
local float_term = Terminal:new({
  direction = "float",
  hidden = true,
  -- 切换全屏的函数
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<Esc>", [[<C-\><C-n>]], {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-h>", [[<C-\><C-n><C-W>h]], {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-j>", [[<C-\><C-n><C-W>j]], {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-k>", [[<C-\><C-n><C-W>k]], {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-l>", [[<C-\><C-n><C-W>l]], {noremap = true, silent = true})
    -- 设置全屏切换快捷键
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<leader>tf", "<cmd>lua _toggle_float_term_fullscreen()<CR>", {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<leader>tf", "<cmd>lua _toggle_float_term_fullscreen()<CR>", {noremap = true, silent = true})
  end,
})

-- 切换全屏的函数
function _toggle_float_term_fullscreen()
  local term = float_term
  if not term:is_open() then
    term:open()
  else
    if term.float_opts.width == vim.o.columns and term.float_opts.height == vim.o.lines then
      -- 恢复原始大小
      term.float_opts = {
        border = "single",
        width = math.floor(vim.o.columns * 0.8),
        height = math.floor(vim.o.lines * 0.8),
      }
    else
      -- 设置为全屏
      term.float_opts = {
        border = "none",
        width = vim.o.columns,
        height = vim.o.lines,
      }
    end
    -- 重新打开以应用新的大小
    term:close()
    term:open()
  end
end

-- 创建命令来打开全屏终端
vim.api.nvim_create_user_command('FloatTerm', function()
  _toggle_float_term_fullscreen()
end, {})

-- 设置快捷键来打开全屏终端
vim.keymap.set('n', '<leader>ft', '<cmd>FloatTerm<CR>', {noremap = true, silent = true})

-- next/prev terminal
local function switch_terminal(offset)
  local terms = require("toggleterm.terminal").get_all(true)
  if #terms == 0 then return end
  local cur_id = require("toggleterm.terminal").get_focused_id()
  local cur_idx = 1
  for i, t in ipairs(terms) do
    if t.id == cur_id then cur_idx = i break end
  end
  local next_idx = ((cur_idx - 1 + offset) % #terms) + 1
  local next_term = terms[next_idx]
  if cur_id then require("toggleterm.terminal").get(cur_id):close() end
  next_term:open()
end

vim.keymap.set({ 'n', 't' }, '<C-]>', function() switch_terminal(1) end, { noremap = true, silent = true, desc = "Next terminal" })
vim.keymap.set({ 'n', 't' }, '<C-[>', function() switch_terminal(-1) end, { noremap = true, silent = true, desc = "Prev terminal" })
