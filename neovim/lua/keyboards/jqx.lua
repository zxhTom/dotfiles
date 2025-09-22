function jqx_query_word_under_cursor()
  local word = vim.fn.expand("<cword>")
  if word == "" then
    print("nvim-jqx: No word under cursor.")
    return
  end

  -- 构建一个通用的 jq 查询。
  -- 这个查询会递归地查找所有包含该键的对象，并返回该键的值。
  -- 使用 string.format 来构建查询字符串，并正确转义引号。
  local query = string.format("%s", word)

  -- 尝试执行 JqxQuery 命令
  -- 注意：JqxQuery 命令需要在一个有效的 JSON/YAML 文件缓冲区中执行
  vim.cmd("JqxQuery " .. query)
end

vim.api.nvim_set_keymap(
  "n",
  "<leader>jj",
  ":JqxList<CR>",
  { noremap = true, silent = true, desc = "Jqx: List JSON/YAML keys" }
)

-- <leader>jq: 执行 JqxQuery，提示用户输入 jq 查询表达式
vim.api.nvim_set_keymap(
  "n",
  "<leader>jq",
  ":JqxQuery<CR>",
  { noremap = true, silent = true, desc = "Jqx: Execute jq query" }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>jw",
  ":lua jqx_query_word_under_cursor()<CR>",
  { noremap = true, silent = true, desc = "Jqx: Query word under cursor" }
)


