return{ 
  {
    "stevearc/oil.nvim",
    priority = 1000,
    ---@module 'oil'
    ---@type oil.SetupOpts
    -- Optional dependencies
    -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    -- lazy = false,
    config = function()
      require("utils.import").all("oil")
    end,
    enabled=lvim.toms.plugins.oil.enabled or false
  },
  {
    "refractalize/oil-git-status.nvim",
    dependencies = {
      "stevearc/oil.nvim",
    },
    config = true,
    enabled=lvim.toms.plugins.oil.enabled or false,
  }
}
