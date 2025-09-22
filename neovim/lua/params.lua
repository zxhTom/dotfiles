_G.toms = _G.toms or {}
toms = {
  loaded={},
  plugins = {
    -- theme
    ["monokai"] = { enabled = true },
    ["kanagawa"] = { enabled = true },
    ["catppuccin"] = { enabled = true },
    ["material"] = { enabled = true },
    ["tokyonight"] = { enabled = true },

    -- status
    ["statusline"] = { enabled = false },
    ["lualine"] = { enabled = true },

    ["astrocore"] = { enabled = true },
    ["copilotchat"] = { enabled = false },
    ["copilot"] = { enabled = false },
    ["dap-python"] = { enabled = true },
    ["flit"] = { enabled = true },
    ["formatter"] = { enabled = true },
    ["glow"] = { enabled = true },
    ["goto-preview"] = { enabled = true },
    ["lazygit"] = { enabled = true },
    ["leap"] = { enabled = true },
    ["lspconfig"] = { 
      enabled = true ,
      custom = true,
    },
    ["lspsaga"] = { enabled = true },
    ["neogen"] = { enabled = true },
    ["nvim-gmove"] = { enabled = true },
    ["nvim-jdtl"] = { enabled = true },
    ["nvim-lastplace"] = { enabled = true },
    ["nvim-surround"] = { enabled = true },
    ["swenv"] = { enabled = true },
    ["symbols-outline"] = { enabled = true },
    ["targets"] = { enabled = true },
    ["telescope"] = { enabled = true },
    ["todo-comments"] = { enabled = true },
    ["undotree"] = { enabled = true },
    ["vim-tmux-navigator"] = { enabled = true },
    ["vim-translator"] = { enabled = true },
    ["vscode"] = { enabled = false },
    ["wilder"] = { enabled = true },
    ["showkeys"] = { enabled = false },
    ["oil"] = { enabled = true },
    ["noice"] = { 
      enabled = true,
      cmdline = {
        enabled = true,  -- 启用命令行
      },
    },
    ["minifile"] = { 
      enabled = true ,
      show_hidden=false,
    },
  }
}
