return {
  {
    "kristijanhusak/vim-dadbod-ui",
    lazy = false,
    config = function()
      require("utils.import").all("dadbod.dadbod-ui")
    end
  },
  {
    "kristijanhusak/vim-dadbod-completion",
    lazy = false,
    config = function()
      require("utils.import").all("dadbod.dadbod-completion")
    end
  },
  {
    "tpope/vim-dadbod",
    lazy = false,
    config = function()
      require("utils.import").all("dadbod.dadbod")
    end
  },
}
