    require('mini.files').setup({
      mappings = {
        synchronize = 'w',
        add='a',
      },
      auto_synchronize = true,
      -- Customization of shown content
      content = {
        -- Predicate for which file system entries to show
        filter = toms.plugins.minifile.show_hidden and 
          function() return true end or  -- 显示所有文件
          function(fs_entry) return not fs_entry.name:match('^%.') 
        end , -- 隐藏点文件
        -- What prefix to show to the left of file system entry
        prefix = nil,
        -- In which order to show file system entries
        sort = nil,
      },
      -- 常用配置选项
      options = {
        -- 永久显示目录中的 .gitignore 文件
        -- permanent_delete = false,
        use_as_default_explorer = true, -- 替换 netrw
        show_hidden = false,
      },
      -- 窗口配置
      windows = {
        preview = true,      -- 显示文件预览
        width_focus = 30,    -- 焦点窗口宽度
        width_preview = 50,  -- 预览窗口宽度
      },
    })

