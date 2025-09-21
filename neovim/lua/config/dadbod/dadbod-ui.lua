  -- 数据库UI设置
  vim.g.db_ui_show_help = 0
  vim.g.db_ui_win_position = 'left'
  vim.g.db_ui_winwidth = 40
  vim.g.db_ui_use_nerd_fonts = 1
  vim.g.db_ui_show_database_icon = 1
  vim.g.db_ui_save_location = vim.fn.stdpath("config") .. "/db_connections"
  vim.g.db_ui_auto_execute_table_helpers = 1
  vim.g.db_ui_table_helpers = {
    mysql = {
      Describe = "DESCRIBE {table}",
      List = "SELECT * FROM {table} LIMIT 100",
    },
    postgresql = {
      Describe = "\\d {table}",
      List = "SELECT * FROM {table} LIMIT 100",
    }
  }

