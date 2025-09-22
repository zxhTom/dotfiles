print("dadbod>>>>>>>>>>>>")
-- 基础快捷键
-- vim.keymap.set('n', '<leader>de', ':DB<Space>', { desc = "DB execute" })
vim.keymap.set('n', '<leader>dl', ':DB<CR>', { desc = "Last DB query" })
 -- 执行快捷键
vim.keymap.set('n', '<leader>de', ':DB<CR>', { desc = 'Execute query' })
vim.keymap.set('n', '<leader>dd', ':DB <C-r>=getline(".")<CR><CR>', { noremap = true, silent = true, desc = "Execute current line SQL" })
vim.keymap.set('v', '<leader>de', ':DB<CR>', { desc = 'Execute visual query' })

-- ~/.config/nvim/lua/plugins/dadbod-smart.lua
-- ~/.config/nvim/lua/plugins/dadbod-smart.lua
local M = {}

function M.execute_smart_sql()
  local mode = vim.api.nvim_get_mode().mode
  if mode == 'v' or mode == 'V' then
    vim.cmd('DB')
    return
  end

  local start_line, end_line = M.find_sql_statement_boundaries(vim.fn.line('.'))
  local content = M.get_lines_content(start_line, end_line)
  
  if content and content ~= "" then
    vim.cmd('DB ' .. content)
  end
end

-- 查找 SQL 语句的起始和结束行号
function M.find_sql_statement_boundaries(current_line)
  local buf_line_count = vim.fn.line('$')
  
  -- 向上查找语句开始
  local start_line = current_line
  for i = current_line - 1, 1, -1 do
    local line = vim.fn.getline(i)
    if not line or line:match("^%s*$") then
      -- 遇到空行，停止向上查找
      break
    end
    start_line = i
  end
  
  -- 向下查找语句结束（分号结尾）
  local end_line = current_line
  local found_semicolon = false
  for i = current_line, buf_line_count do
    local line = vim.fn.getline(i)
    if not line then break end
    
    -- 检查是否以分号结尾（忽略行尾空格）
    if line:match(";%s*$") then
      end_line = i
      found_semicolon = true
      break
    end
    
    -- 如果遇到空行且还没有找到分号，停止向下查找
    if line:match("^%s*$") and not found_semicolon then
      break
    end
    
    end_line = i
  end
  
  return start_line, end_line
end

-- 获取指定行范围内的内容（正确处理分号）
function M.get_lines_content(start_line, end_line)
  local content = ""
  for i = start_line, end_line do
    local line = vim.fn.getline(i)
    if line then
      -- 如果是最后一行且以分号结尾，去掉分号
      if i == end_line and line:match(";%s*$") then
        line = line:gsub(";%s*$", "")
      end
      content = content .. line .. " "
    end
  end
  
  return content:gsub('%s+', ' '):gsub('^%s*(.-)%s*$', '%1')
end

-- 高亮显示执行范围（可选）
function M.highlight_execution_range(start_line, end_line)
  -- 清除之前的高亮
  vim.cmd('match none')
  
  -- 设置可视范围标记
  vim.fn.setpos("'<", {0, start_line, 1, 0})
  vim.fn.setpos("'>", {0, end_line, 999, 0})
  
  -- 添加临时高亮
  vim.cmd('highlight DebugHighlight guibg=#2e2e2e')
  vim.cmd(string.format('match DebugHighlight /\\%%>%dl\\%%<%dl/', start_line - 1, end_line + 1))
  
  -- 2秒后清除高亮
  vim.defer_fn(function()
    vim.cmd('match none')
  end, 2000)
end

function M.execute_current_line_only()
  local line_content = vim.fn.getline('.')
  if line_content and line_content ~= '' then
    -- 去掉当前行的分号（如果存在）
    line_content = line_content:gsub(";%s*$", "")
    vim.cmd('DB ' .. line_content:gsub('^%s*(.-)%s*$', '%1'))
  end
end

-- 增强的智能执行（带高亮）
function M.execute_smart_sql_with_highlight()
  local mode = vim.api.nvim_get_mode().mode
  if mode == 'v' or mode == 'V' then
    vim.cmd('DB')
    return
  end

  local start_line, end_line = M.find_sql_statement_boundaries(vim.fn.line('.'))
  local content = M.get_lines_content(start_line, end_line)
  
  if content and content ~= "" then
    -- 显示高亮范围
    M.highlight_execution_range(start_line, end_line)
    
    -- 显示执行信息
    local line_count = end_line - start_line + 1
    vim.notify(string.format('执行 %d 行: %s', line_count, content:sub(1, 50) .. (content:len() > 50 and '...' or '')), 
               vim.log.levels.INFO)
    
    vim.cmd('DB ' .. content)
  end
end

-- 快捷键映射
vim.keymap.set('n', '<leader>ds', M.execute_smart_sql_with_highlight, { desc = "Smart execute SQL with highlight" })
vim.keymap.set('n', '<leader>dl', M.execute_current_line_only, { desc = "Execute current line only" })
vim.keymap.set('n', '<leader>df', ':w<CR>:DB<CR>', { desc = "Execute entire file" })
vim.keymap.set('v', '<leader>ds', ':DB<CR>', { desc = "Execute visual selection" })

return M
