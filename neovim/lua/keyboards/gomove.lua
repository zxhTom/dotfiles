local map = vim.api.nvim_set_keymap
map("n", "<S-h>", "<Plug>GoNSMLeft", {})
map("n", "<S-j>", "<Plug>GoNSMDown", {})
map("n", "<S-k>", "<Plug>GoNSMUp", {})
map("n", "<S-l>", "<Plug>GoNSMRight", {})

map("x", "<S-h>", "<Plug>GoVSMLeft", {})
map("x", "<S-j>", "<Plug>GoVSMDown", {})
map("x", "<S-k>", "<Plug>GoVSMUp", {})
map("x", "<S-l>", "<Plug>GoVSMRight", {})

map("n", "<C-c>h", "<Plug>GoNSDLeft", {})
map("n", "<C-c>j", "<Plug>GoNSDDown", {})
map("n", "<C-c>k", "<Plug>GoNSDUp", {})
map("n", "<C-c>l", "<Plug>GoNSDRight", {})

map("x", "<C-m>h", "<Plug>GoVSDLeft", {})
map("x", "<C-m>j", "<Plug>GoVSDDown", {})
map("x", "<C-m>k", "<Plug>GoVSDUp", {})
map("x", "<C-m>l", "<Plug>GoVSDRight", {})

