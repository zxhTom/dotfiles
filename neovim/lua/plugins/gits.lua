return {
	{
		"sindrets/diffview.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Diffview open" })
			vim.keymap.set("n", "<leader>gdc", "<cmd>DiffviewClose<cr>", { desc = "Diffview close" })
		end,
	},
	{
		"NeogitOrg/neogit",
		dependencies = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" },
		config = function()
			require("neogit").setup({})
			vim.keymap.set("n", "<leader>ng", "<cmd>Neogit<cr>", { desc = "Neogit" })
		end,
	},
	{
		"f-person/git-blame.nvim",
		config = function()
			require("gitblame").setup({
				enabled = false, -- 默认禁用，按需开启
			})
			vim.keymap.set("n", "<leader>gb", "<cmd>GitBlameToggle<cr>", { desc = "Toggle git blame" })
		end,
	},
	{
		"rhysd/git-messenger.vim",
		config = function()
			vim.keymap.set("n", "<leader>gm", "<cmd>GitMessenger<cr>", { desc = "Git messenger" })
		end,
	},
	{ "tpope/vim-rhubarb" }, -- 需要配合 vim-fugitive 使用
}
