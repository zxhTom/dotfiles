return {
	"tpope/vim-fugitive",
	cmd = {
		"G",
		"Git",
		"Gdiffsplit",
		"Gread",
		"Gwrite",
		"Ggrep",
		"GMove",
		"GDelete",
		"GBrowse",
		"GRemove",
		"GRename",
		"Glgrep",
		"Gedit",
	},
	ft = { "fugitive" },
	keys = {
		{ "<leader>ge", "<cmd>Git<cr>", desc = "Git status" },
		{ "<leader>gd", "<cmd>Gdiffsplit<cr>", desc = "Git diff" },
		{ "<leader>gD", "<cmd>Gvdiffsplit<cr>", desc = "Git vertical diff" },
		{ "<leader>gb", "<cmd>Git blame<cr>", desc = "Git blame" },
		{ "<leader>gl", "<cmd>Git log<cr>", desc = "Git log" },
		{ "<leader>gL", "<cmd>Git log --oneline<cr>", desc = "Git log oneline" },
		{ "<leader>gc", "<cmd>Git commit<cr>", desc = "Git commit" },
		{ "<leader>gC", "<cmd>Git commit --amend<cr>", desc = "Git commit amend" },
		{ "<leader>gp", "<cmd>Git push<cr>", desc = "Git push" },
		{ "<leader>gP", "<cmd>Git pull<cr>", desc = "Git pull" },
		{ "<leader>gf", "<cmd>Git fetch<cr>", desc = "Git fetch" },
		{ "<leader>gF", "<cmd>Git fetch --all<cr>", desc = "Git fetch all" },
		{ "<leader>gB", "<cmd>Git branch<cr>", desc = "Git branch" },
		{ "<leader>go", "<cmd>GBrowse<cr>", desc = "Open in browser" },
		{ "<leader>ga", "<cmd>Git add %<cr>", desc = "Git add current file" },
		{ "<leader>gA", "<cmd>Git add .<cr>", desc = "Git add all" },
	},
	config = function()
		-- 配置选项
		vim.g.fugitive_no_maps = 1

		-- 自动命令
		local augroup = vim.api.nvim_create_augroup("fugitive_config", { clear = true })
	end,
}
