return {
	{
		"echasnovski/mini.files",
		version = "*",
		enabled = true,
		lazy = false,
		config = function()
			require("utils.import").all("mini.file")
			-- require("config.minifile")
			-- require("keyboards.minifile")
		end,
	},
	{
		"echasnovski/mini.splitjoin",
		version = "*",
		config = function()
			require("utils.import").all("mini.splitjoin")
		end,
	},
}
