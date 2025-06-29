require("mason-lspconfig").setup({
  ensure_installed = {
    -- "jdtls", "pyright", "bashls", "lua_ls",
    -- "clangd", "gopls", "rust_analyzer",
    -- "html", "cssls", "tailwindcss",
    -- "jsonls", "marksman", "yamlls"
  },
  handlers = {
    -- 其他 LSP 的配置...
    ["lua_ls"] = nil,  -- 关键：禁用对 lua_ls 的自动配置
  },
  automatic_installation = true,
})
