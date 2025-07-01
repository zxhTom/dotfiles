local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    -- 格式化
    null_ls.builtins.formatting.stylua,    -- Lua
    null_ls.builtins.formatting.black,     -- Python
    null_ls.builtins.formatting.prettier,  -- JS/TS/HTML/CSS
    null_ls.builtins.formatting.shfmt,     -- Shell
    null_ls.builtins.formatting.clang_format, -- C/C++
    null_ls.builtins.formatting.google_java_format, -- Java
    
  },
  on_attach = function(client, bufnr)
    vim.keymap.set("n", "<leader>fm", function()
      vim.lsp.buf.format({ async = true })
    end, { buffer = bufnr, desc = "格式化文件" })
  end,
})

