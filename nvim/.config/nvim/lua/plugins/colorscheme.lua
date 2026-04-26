return {
  -- LazyVim 配置项，设置默认主题
  {
    "LazyVim/LazyVim",
    opts = {
      -- 选择主题
      -- colorscheme = "catppuccin",
      colorscheme = "dracula",
    },
  },
  -- Catppuccin 主题
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha", -- 可选 "latte", "frappe", "macchiato", "mocha"
      transparent_background = true,
    },
  },
  -- Dracula 主题
  {
    "binhtran432k/dracula.nvim",
    lazy = false, -- 等价于 priority = 1000，确保主题在启动时加载
    priority = 1000,
    config = function()
      require("dracula").setup({
        style = "default", -- 可选 "default", "soft", "day"
        transparent = false, -- 背景是否透明
        terminal_colors = true, -- 终端颜色
      })
      vim.cmd.colorscheme("dracula")
    end,
  },
}