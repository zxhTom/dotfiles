file = require("utils.file")
local M = {}
M.setup = function(module)
  local subModuleName = "setup." .. module
  if package.loaded[subModuleName] then return end
  if not file.module_exists_vim("setup." .. module) then
    return
  end
  require("setup." .. module)
end
M.keyboards = function(module)
  local subModuleName = "keyboards." .. module
  if toms[subModuleName] then return end
  if not file.module_exists_vim("keyboards." .. module) then
    return
  end
  require("keyboards." .. module)
end
M.config = function(module)
  local subModuleName = "config." .. module
  if package.loaded[subModuleName] then return end
  if not file.module_exists_vim("config." .. module) then
    return
  end
  require("config." .. module)
end
M.all = function(module)
  M.setup(module)
  M.config(module)
  M.keyboards(module)
end
return M
