    require('mini.files').setup({
      -- 常用配置选项
      options = {
        -- 永久显示目录中的 .gitignore 文件
        permanent_delete = false,
        use_as_default_explorer = true, -- 替换 netrw
      },
      -- 窗口配置
      windows = {
        preview = true,      -- 显示文件预览
        width_focus = 30,    -- 焦点窗口宽度
        width_preview = 50,  -- 预览窗口宽度
      },
    })

