require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto', -- 自动根据 colorscheme 选择主题
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {} -- 禁用特定文件类型的状态栏
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {}, -- 可以配置标签栏显示
  extensions = {} -- 可以加载扩展如 fugitive, nvim-tree 等
}
