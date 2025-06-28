local M = {}
M.is_relative_path = function(path)
  -- Unix/Linux 和 Windows 下的判断
  return not (path:find("^/") or path:find("^%a:[/\\]"))
end
M.get_script_dir = function()
  local path = debug.getinfo(2, "S").source:sub(2)
  return vim.fn.fnamemodify(path, ":h")
end
M.get_parent_dir = function(path)
  return vim.fn.fnamemodify(path, ":h")
end
M.path_join = function(...)
  local sep = package.config:sub(1, 1) -- 获取系统分隔符
  local parts = { ... }
  local is_absolute = false
  local root_part = ""

  -- 处理第一部分（检测绝对路径）
  if #parts > 0 then
    parts[1] = tostring(parts[1])
    -- 检测Unix绝对路径或Windows盘符路径
    is_absolute = parts[1]:find("^/") or parts[1]:find("^%a:[\\/]")
    -- 如果是绝对路径，保存根部分
    if is_absolute then
      if parts[1]:find("^/") then
        root_part = "/"
      else
        root_part = parts[1]:sub(1, 3):gsub("/", "\\") -- Windows盘符处理
      end
    end
    -- 移除首尾分隔符
    parts[1] = parts[1]:gsub("[" .. sep .. "]+$", ""):gsub("^[" .. sep .. "]+", "")
  end

  -- 处理剩余部分
  for i = 2, #parts do
    parts[i] = tostring(parts[i])
    parts[i] = parts[i]:gsub("[" .. sep .. "]+$", ""):gsub("^[" .. sep .. "]+", "")
  end

  -- 拼接路径
  local raw_path = table.concat(parts, sep)

  -- 解析相对路径符号
  local resolved = {}
  for part in raw_path:gmatch("[^" .. sep .. "]+") do
    if part == ".." then
      if #resolved > 0 then
        table.remove(resolved)
      end
    elseif part ~= "." then
      table.insert(resolved, part)
    end
  end

  -- 重新组合路径
  local result = table.concat(resolved, sep)

  -- 处理绝对路径前缀
  if is_absolute then
    if root_part == "/" then
      result = "/" .. result
    else
      -- Windows盘符路径
      result = root_part .. result
    end
  end

  -- 如果是Windows盘符路径，确保使用反斜杠
  if is_absolute and sep == "\\" and not result:find("^%a:\\") then
    result = root_part .. result:gsub("/", "\\")
  end

  return result
end
M.normalize_path = function(path)
  -- 标记是否是绝对路径
  local is_absolute = path:match("^/") ~= nil
  -- 统一分隔符并合并重复斜杠
  path = path:gsub("\\", "/"):gsub("/+", "/")
  -- 如果是绝对路径且丢失了开头的/
  if is_absolute and not path:match("^/") then
    path = "/" .. path
  end
  return path
end

M.smart_join = function(...)
  return M.normalize_path(M.path_join(...))
end

M.module_exists = function(module_name)
  local module_path = package.searchpath(module_name, package.path)
  if not module_path then return false end

  -- 转换为绝对路径
  local full_path = vim.fn.fnamemodify(module_path, ':p')
  print(full_path)
  return vim.fn.filereadable(full_path) == 1
end
M.module_exists_vim = function(module_name)
  local lua_file = string.gsub(module_name, "%.", "/")
  local paths = vim.split(package.path, ";")
  for _, path in ipairs(paths) do
    local full_path = string.gsub(path, "%?", lua_file)
    if M.is_relative_path(full_path) then
      full_path = M.smart_join(M.get_parent_dir(M.get_script_dir()), full_path)
    end
    if vim.fn.filereadable(full_path) == 1 then
      return true
    end
  end
  return false
end
return M
