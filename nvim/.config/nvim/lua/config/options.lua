-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- ~/.config/nvim/lua/config/options.lua

-- Python LSP 配置
vim.g.lazyvim_python_lsp = "basedpyright" -- 推荐 basedpyright，对类型提示更友好
vim.g.lazyvim_python_ruff = "ruff" -- 使用 Ruff 进行 Linting 和格式化

-- 启用真彩色支持（确保 Kitty 颜色显示正确）
vim.opt.termguicolors = true
