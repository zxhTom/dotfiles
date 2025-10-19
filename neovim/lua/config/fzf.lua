-- 设置 fzf 使用 fd 作为默认文件查找工具
vim.env.FZF_DEFAULT_COMMAND = "fd --type f --hidden --follow --exclude .git"

-- 设置 fzf 布局和样式
vim.g.fzf_layout = { down = "40%" }
vim.g.fzf_preview_window = { "right,50%", "ctrl-/" }
