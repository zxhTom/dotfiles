require("bufferline").setup({
  options = {
    mode = "buffers", -- 可选 "buffers" 模式
    diagnostics = "nvim_lsp",
    offsets = {
      { filetype = "NvimTree", text = "File Explorer" },
    },
    mappings={
      pick_buffer = 'gb',
    },
    -- 字母标记样式（可选）
    numbers = function(opts)
      return string.format('[%s]', opts.lower(opts.id)) -- 如 [a], [b]
    end,
  },
})
