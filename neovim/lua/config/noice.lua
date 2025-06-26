-- hello
-- 在 init.lua 中覆盖 vim.notify
vim.notify = function(msg, level, opts)
  require("noice").notify(msg, level, opts)
end
require("noice").setup({
  cmdline = {
    enabled = true,
    view = "cmdline",  -- 居中 cmdline
    format = {
      -- 自定义 cmdline 样式
      cmdline = { icon = ">" },
      search_down = { icon = "🔍⌄" },
      search_up = { icon = "🔍⌃" },
    },
  },
  messages = {
    enabled = true,
    view = "mini",  -- 消息提示样式
  },
  popupmenu = {
    enabled = true,   -- 让 noice 接管补全菜单（需 nui.nvim 支持）
    backend = "nui",  -- 使用 nui.nvim 渲染补全菜单
  },
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    -- override = {
    --   ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
    --   ["vim.lsp.util.stylize_markdown"] = true,
    --   ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    -- },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
})
