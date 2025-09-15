  -- 自动命令：SQL文件类型设置
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "sql", "mysql", "plsql" },
    callback = function()
      -- 启用数据库补全
      vim.bo.completeopt = "menu,menuone,noselect"
      require('cmp').setup.buffer({
        sources = {
          -- 在 SQL 文件中优先显示数据库补全
          { name = 'vim-dadbod-completion', priority = 1000 },
          { name = 'buffer', priority = 500 },
          { name = 'nvim_lsp', priority = 400 },
        }
      })
    end,
  })

  -- 自动命令：打开数据库UI时的设置
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "dbui",
    callback = function()
      -- 设置数据库UI的快捷键
      vim.keymap.set("n", "l", "<CMD>DBUIOpenLine<CR>", { buffer = true, desc = "Open table/query" })
      vim.keymap.set("n", "h", "<CMD>DBUIClose<CR>", { buffer = true, desc = "Close DBUI" })
      vim.keymap.set("n", "a", "<CMD>DBUIAddConnection<CR>", { buffer = true, desc = "Add connection" })
    end,
  })

  -- 自动重新连接
    vim.api.nvim_create_autocmd({'BufEnter', 'BufRead'}, {
      pattern = '*.sql',
      callback = function()
        if vim.g.db then
          vim.cmd('silent! DB ' .. vim.g.db)
        end
      end
    })


-- 添加 SQL 格式化
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'sql',
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.expandtab = true
    
    -- SQL 格式化快捷键
    vim.keymap.set('n', '<leader>df', ':%!sqlformat --reindent --keywords upper -<CR>', 
                  { buffer = true, desc = 'Format SQL' })
  end
})
