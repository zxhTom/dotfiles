local ok,minifiles = pcall(require,"mini.files")
local function current_dir()
  local bufname = vim.api.nvim_buf_get_name(0)  -- 获取当前 Buffer 名称
  local root_path=bufname
  if bufname:match("^oil://") then
    root_path = bufname:gsub("^oil://", "")
  end
  return root_path
end

-- 切换文件浏览器 (在 normal 模式)
vim.keymap.set('n', '<leader>e', function()
  -- require("notify")("快捷键通知已触发", "warn")
  if not MiniFiles.close() then
    -- MiniFiles.open(_G.NVIM_INITIAL_PATH)
    minifiles.open(_G.NVIM_INITIAL_PATH)
  end
end, { desc = 'Toggle file explorer' })

vim.keymap.set('n', '<leader>Fc', function()
  -- require("notify")("快捷键通知已触发", "warn")
  if not MiniFiles.close() then
    -- MiniFiles.open(_G.NVIM_INITIAL_PATH)
    -- print(vim.fn.getcwd())
    -- print(require("oil").get_current_dir())
    minifiles.open(vim.fn.getcwd())
  end
end, { desc = 'Toggle file explorer' })

vim.keymap.set('n', '<leader>Fn', function()
  -- require("notify")("快捷键通知已触发", "warn")
  if not MiniFiles.close() then
    -- MiniFiles.open(_G.NVIM_INITIAL_PATH)
    -- minifiles.open(require("oil").get_current_dir())
    print(current_dir())
    minifiles.open(current_dir())
  end
end, { desc = 'Toggle file explorer' })


-- 全局切换快捷键（即使不在文件浏览器中）
local show_hidden = toms.plugins.minifile.show_hidden -- 全局状态记录


local function toggle_hidden()
  local minifiles=require('mini.files')
  show_hidden = not show_hidden
  toms.plugins.minifile.show_hidden = show_hidden -- 更新全局状态
  config_content = minifiles.config.content
  local content = {
      filter = show_hidden and 
        function() return true end or  -- 显示所有文件
        function(fs_entry) return not fs_entry.name:match('^%.') end  -- 隐藏点文件
  }
  for k,v in pairs(content) do
    minifiles.config.content[k] = v -- t2的键值会覆盖t1
  end
  minifiles.setup(minifiles.config)
  vim.cmd("silent! lua MiniFiles.Close()")
  vim.defer_fn(function()
      vim.cmd(string.format("lua MiniFiles.open(\"%s\")",_G.NVIM_INITIAL_PATH))
  end, 50)
end

-- 绑定快捷键
vim.keymap.set('n', '<leader>.', toggle_hidden, { desc = 'Toggle hidden files' })

