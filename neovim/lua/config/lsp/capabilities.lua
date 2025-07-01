local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()

return vim.tbl_deep_extend('force', lsp_capabilities, cmp_capabilities)
