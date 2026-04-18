-- ~/.config/nvim/lua/plugins/python-test.lua

return {
  -- Neotest Python 配置
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        ["neotest-python"] = {
          dap = { justMyCode = false }, -- 允许调试库代码
          args = { "--capture=no" }, -- 实时输出测试结果
          pytest_discover_instances = true, -- 自动发现 pytest 实例
        },
      },
    },
  },

  -- DAP Python 调试配置
  {
    "mfussenegger/nvim-dap-python",
    opts = {
      justMyCode = false, -- 允许调试第三方库
    },
  },
}
