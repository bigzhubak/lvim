lvim.leader = "space"
lvim.keys.normal_mode["<Leader>C"] = ":tabclose <CR>"
-- markdown to mindmap https://markmap.js.org/docs#markmap-cli
lvim.keys.normal_mode["<Leader>m"] = ":! markmap %<CR>"
-- 查看格式化和检查, 一些工具需要额外安装 https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
lvim.keys.normal_mode["<Leader>i"] = ":NullLsInfo<CR>"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- open outline
lvim.keys.normal_mode["<Leader>o"] = ":SymbolsOutline<CR>"
-- 关闭左右的 buffer, https://github.com/akinsho/bufferline.nvim 提供
lvim.keys.normal_mode["<Leader>O"] = ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>"

-- 我自己的 Markdown wiki 系统
lvim.keys.normal_mode["<C-f>"] = ":SearchMD "
lvim.keys.normal_mode["<F4>"] = "<Plug>MarkdownPreview"

-- buggerline 的左右切换
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
