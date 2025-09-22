return {
  "gennaro-tedesco/nvim-jqx",
  ft = { "json", "yaml" }, -- 非常重要：只在打开 json 或 yaml 文件时加载插件，节省启动时间
  -- 可选的按键映射配置也可以在 opts 里完成
  config=function()
    require("utils.import").all("jqx")
  end
}
