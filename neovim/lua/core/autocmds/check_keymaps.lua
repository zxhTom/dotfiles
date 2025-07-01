vim.api.nvim_create_user_command("CheckKeyConflict", 
  function(opts)
    require("check_keymaps").show_conflict_report()
  end,
  { nargs = "?", desc = "交互式检查快捷键冲突" }
)
