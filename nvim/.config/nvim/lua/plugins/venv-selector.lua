-- ~/.config/nvim/lua/plugins/venv-selector.lua
return {
  "linux-cultist/venv-selector.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim", -- 核心依赖，提供选择界面
    "mfussenegger/nvim-dap-python",  -- 可选，用于调试集成
  },
  config = function()
    require("venv-selector").setup({
      -- 个性化配置

      -- 确保全局搜索功能已启用
      search_venv_managers = true,
      search_workspace = true,
      parents = 5, -- 向上搜索的父目录层数，默认5层

      -- 指定 Conda 环境的存储路径
      anaconda_envs_path = vim.fn.expand("~/.miniconda3/envs"),
      anaconda_base_path = vim.fn.expand("~/.miniconda3"),

      fd_binary_name = "/usr/bin/fd", -- 指定 fd 命令名，如果不在 PATH 里可设为绝对路径
      dap_enabled = true, -- 启用与 nvim-dap-python 的集成
    })
  end,
  keys = {
    { "<leader>vs", "<cmd>VenvSelect<cr>", desc = "选择虚拟环境" },
    { "<leader>vc", "<cmd>VenvSelectCached<cr>", desc = "恢复上次环境" },
  },
}