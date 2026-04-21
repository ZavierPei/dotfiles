-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here


-- 为特定文件类型启用自动换行
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "text", "tex", "gitcommit" },
    callback = function()
        -- 启用自动换行
        vim.opt_local.wrap = true
        -- 在单词边界处换行，不会截断单词
        vim.opt_local.linebreak = true
        -- 换行后保持与上一行相同的缩进
        vim.opt_local.breakindent = true
    end,
})