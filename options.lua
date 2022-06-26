-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
-- replace defalut config, do not to next or last
-- 关闭愚蠢的自动移到上下行
vim.opt.whichwrap = ""

--fold
vim.opt.foldmethod = "indent"
--disable auto fold
vim.opt.foldlevel = 20

--" 输入tab 转为2个空格
vim.opt.expandtab = true
-- 设置制表符空格数
vim.opt.softtabstop = 2
-- 设置缩进空格数
vim.opt.shiftwidth = 2

--无限回滚

vim.opt.undodir = os.getenv("HOME") .. "/.vimundodir"
vim.bo.undofile = true

-- need unstall which-key https://github.com/folke/which-key.nvim
