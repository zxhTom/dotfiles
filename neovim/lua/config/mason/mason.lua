require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})


require("mason-lspconfig").setup({
  automatic_enable = false,
  -- ensure_installed = {
  --   "jdtls", "pyright", "bashls", "lua_ls",
  --   "clangd", "gopls", "rust_analyzer",
  --   "html", "cssls", "tailwindcss",
  --   "jsonls", "marksman", "yamlls"
  -- },
  -- handlers = {
  --   -- 其他 LSP 的配置...
  --   ["lua_ls"] = nil,  -- 关键：禁用对 lua_ls 的自动配置
  -- },
  automatic_installation = true,
  -- automatic_enable = {
  --   exclude = {
  --       "lua_ls",
  --       "rust_analyzer",
  --       "ts_ls"
  --   }
  -- }
})


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


require("config.mason.tool_installer")
