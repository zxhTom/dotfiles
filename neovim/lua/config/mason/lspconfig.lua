local capabilities = require('config.lsp.capabilities')
print"hello"
local function load_config(server_name)
  print("lspconfig"..server_name)
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
    "volar",
		-- you can pin a tool to a particular version
    "golangci-lint",
		-- you can turn off/on auto_update per tool
		"bash-language-server",
		-- you can do conditional installing
    "gopls",
		"lua-language-server",
		"vim-language-server",
		"stylua",
		"shellcheck",
		"editorconfig-checker",
		"gofumpt",
		"golines",
		"gomodifytags",
		"gotests",
		"impl",
		"json-to-struct",
		"luacheck",
		"misspell",
		"revive",
		"shellcheck",
		"shfmt",
		"staticcheck",
		"vint",
		"pyright", -- Python LSP
    'pylsp',         -- 官方 Python 语言服务器
    'ruff-lsp',      -- 基于 Ruff 的 LSP（快速格式化 + Linter）
      -- Java LSP
    'jdtls',         -- Eclipse 的 Java 语言服务器（需额外配置 JDK 路径）   'jedi-language-server', -- 基于 Jedi 的补全引擎
		"black", -- Python 格式化
		"isort", -- Python import 排序
		"debugpy", -- Python 调试器
		"ruff", -- Python linting
  },
  handlers = {
    function(server_name) -- 这个函数会对每个已安装的 LSP 执行
      print("lspconfog"..server_name)
      require("lspconfig")[server_name].setup(load_config(server_name))
    end,
  },
})
