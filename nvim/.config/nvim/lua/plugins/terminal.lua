-- ~/.config/nvim/lua/plugins/terminal.lua

return {
  -- 使用 Snacks.nvim 的 terminal 组件（LazyVim 默认）
  {
    "folke/snacks.nvim",
    opts = {
      terminal = {
        enabled = true,
        -- 浮动终端配置
        float = {
          border = "rounded",
          width = 0.85,
          height = 0.7,
          -- 居中显示
          row = 0.15,
          col = 0.075,
        },
        -- 终端快捷键映射
        keys = {
          -- 在终端模式下快速退出
          term_normal = {
            ["<A-q>"] = "close",
            ["<Esc><Esc>"] = "normal",
          },
        },
      },
    },
  },

  -- 增强终端快捷键
  {
    "LazyVim/LazyVim",
    opts = {
      keys = {
        -- Python 专用终端：自动激活虚拟环境
        {
          "<leader>tp",
          function()
            Snacks.terminal(nil, {
              cwd = LazyVim.root(),
              env = { VIRTUAL_ENV = "./.venv" },
            })
          end,
          desc = "Terminal (Python venv)",
        },
        -- Pytest 专用终端
        {
          "<leader>tt",
          function()
            Snacks.terminal("pytest", {
              cwd = LazyVim.root(),
              cmd = "pytest",
            })
          end,
          desc = "Run Pytest",
        },
      },
    },
  },
}
