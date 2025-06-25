local plugin_dir = vim.fn.stdpath("config") .. "/lua/plugins"
local plugin_files = vim.fn.globpath(plugin_dir, "*.lua", false, true)

lvim.plugins = {}
for _, file in ipairs(plugin_files) do
  local plugin_name = file:match("([^/]+)%.lua$")
  if lvim.toms and lvim.toms.plugins[plugin_name] and lvim.toms.plugins[plugin_name].enabled then
    local rel_path = file:match(".*lua/(.-)%.lua$")
    package.loaded[rel_path] = nil  -- 清除缓存
    local ok, plugin = pcall(require, rel_path)
    if ok then
      -- 支持 return 单个 plugin 或 table 插件列表
      if type(plugin[1]) == "table"  then
        vim.list_extend(lvim.plugins, plugin)
      else
        table.insert(lvim.plugins, plugin)
      end
    else
      vim.notify("插件加载失败: " .. rel_path, vim.log.levels.ERROR)
    end
  end
end

