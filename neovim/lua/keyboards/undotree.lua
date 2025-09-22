vim.api.nvim_set_keymap(
  "n",
  "<leader>u",
  "<CMD>UndotreeToggle<CR>",
  { noremap = true, silent = true, desc = "Undo Tree" }
)
