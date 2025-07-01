local capabilities = require('config.lsp.capabilities')

local function load_config(server_name)
  local ok, config = pcall(require, "config.lsp.servers." .. server_name:gsub("-", "_"))
  if ok then
    return vim.tbl_deep_extend("force", {
      capabilities = capabilities,
    }, config)
  end
  return { capabilities = capabilities } -- 默认配置
end

require("mason-lspconfig").setup({
  automatic_installation = true,
  ensure_installed = {
    -- "jdtls", "pyright", "bashls", "lua_ls",
    -- "clangd", "gopls", "rust_analyzer",
    -- "html", "cssls", "tailwindcss",
    -- "jsonls", "marksman", "yamlls"
  },
  handlers = {
    function(server_name) -- 这个函数会对每个已安装的 LSP 执行
      require("lspconfig")[server_name].setup(load_config(server_name))
    end,
  },
})
