return {
    "rebelot/kanagawa.nvim",
    branch="master",
    config=function()
      require'utils.import'.all("kanagawa")
    end,
    enabled=toms.plugins.kanagawa.enabled or false,
}
