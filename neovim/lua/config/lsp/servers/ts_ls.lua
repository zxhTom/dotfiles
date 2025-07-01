local util = require('lspconfig.util')

return {
  root_dir = function(fname)
    return not util.root_pattern("deno.json", "deno.jsonc")(fname)
        and util.root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git")(fname)
  end,
  single_file_support = false,
  init_options = {
    preferences = {
      includeCompletionsWithSnippetText = true,
      includeCompletionsForImportStatements = true,
    },
  },
}
