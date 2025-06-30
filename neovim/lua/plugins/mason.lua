return {
  {
    "williamboman/mason.nvim",
    -- commit="baf99d9",
    lazy = false,
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "neovim/nvim-lspconfig",
        -- "saghen/blink.cmp",
    },
    config = function()
      require("utils.import").all("mason.mason")
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    -- commit = "1a31f82",
    dependencies = { "mason.nvim" },
    config = function()
      -- require("utils.import").all("mason.mason")
    end
  },
  {
  "nvimtools/none-ls.nvim",
  dependencies = { "mason.nvim" },
  config = function()
    -- require("utils.import").all("mason.null-ls")
  end
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
      -- require("utils.import").all("mason.tool_installer")
    end
  }
}
