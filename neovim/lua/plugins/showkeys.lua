return { 
    "nvzone/showkeys", 
    event = "VimEnter",
    cmd = "ShowkeysToggle",
    opts={
        maxkeys=6
    },
    config = function()
      require'utils.import'.all("showkeys")
    end,
    enabled=toms.plugins.showkeys.enabled,
}
