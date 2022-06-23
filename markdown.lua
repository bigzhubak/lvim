local home = os.getenv("HOME")
vim.cmd('source ' .. home .. '/.config/lvim/markdown.vim')

-- avoid spelllang error tag chinese tag
vim.cmd [[
set spelllang = "cjk" 
]]
