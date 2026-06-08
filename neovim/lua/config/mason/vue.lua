local lspconfig = require('lspconfig')
local mason_lspconfig = require('mason-lspconfig')
local mason_tool_installer = require('mason-tool-installer')

-- 获取 vue-language-server 的安装路径
-- 如果使用 Mason v2 (推荐)
local vue_language_server_path = vim.fn.stdpath('data') .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

-- 确保安装 `ts_ls` 和 `vue-language-server`
mason_tool_installer.setup({
  ensure_installed = {
    "ts_ls",
    "vue-language-server",
  },
})

-- 定义 LSP capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
-- 如果您有自定义的 capabilities 配置，可以在这里合并
-- capabilities = vim.tbl_deep_extend("force", capabilities, require("config.lsp.capabilities"))

-- 配置 TypeScript 和 Vue 语言服务器
mason_lspconfig.setup({
  -- 确保安装了 ts_ls 和 vue-language-server。这里只是声明，实际安装由 mason_tool_installer 处理。
  -- 如果这里没有列出，handlers 也不会被调用。
  ensure_installed = {
    "ts_ls",
    "vue-language-server",
  },
  handlers = {
    -- 默认处理函数，用于未特殊配置的语言服务器
    function(server_name)
      -- 这里的 print 语句现在应该会执行
      print("lspconfig: Setting up " .. server_name)
      lspconfig[server_name].setup({
        capabilities = capabilities,
        -- 在这里添加通用的 LSP 配置
      })
    end,
    -- 为 ts_ls 配置
    ts_ls = function()
      print("lspconfig: Setting up ts_ls")
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        -- 定义 TypeScript 和 Vue 文件类型
        filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
        init_options = {
          plugins = {
            {
              name = '@vue/typescript-plugin',
              location = vue_language_server_path,
              languages = { 'vue' },
              configNamespace = 'typescript',
            },
          },
        },
      })
    end,
    -- 为 vue_ls 配置
    vue_ls = function()
      print("lspconfig: Setting up vue_ls")
      lspconfig.vue_ls.setup({
        capabilities = capabilities,
        -- vue_ls 自身通常不需要太多配置，因为它会利用 ts_ls 的功能
        filetypes = { 'vue' },
      })
    end,
  },
})

