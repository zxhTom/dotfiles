local M = {}

function M.setup()

  -- 数据库连接配置示例
  vim.g.dbs = {
    dev = 'postgresql://hes:7L2wYCDWLQdqPr4bNsYBMr5nwutckP8Q@192.168.8.200:6543/hes_egm',
    test = 'mysql://user:password@localhost:3306/testdb'
  }

  -- 设置默认数据库（可选）
  vim.g.db = vim.g.dbs.local_pg

end

return M.setup()
-- require("tpope/vim-dadbod").setup({
--   M.setup()
-- })
