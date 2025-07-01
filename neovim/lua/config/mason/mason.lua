require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

require("config.mason.lspconfig")

require("config.mason.null-ls")

require("config.mason.tool_installer")
