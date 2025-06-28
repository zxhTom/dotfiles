-- hello world
require("noice").setup({
  cmdline = {
    enabled = true,  -- 启用命令行
  },
  -- 启用消息节流
  throttle = 1000,  -- 消息间隔至少1秒（单位：毫秒）
  -- 或针对特定事件：
  routes = {
    {
      filter = { event = "msg_show" },
      opts = { throttle = 500 }  -- 单独设置节流时间
    }
  }
})

