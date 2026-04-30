-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- 插入模式下，按 jk 快速返回正常模式
vim.keymap.set("i", "jk", "<Esc>", { desc = "返回正常模式" })

-- 打开Markdown预览
vim.keymap.set("n", "<leader>m", ":MarkdownPreview<CR>")

