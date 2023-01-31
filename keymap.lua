lvim.leader = "space"
lvim.keys.normal_mode["<Leader>C"] = ":tabclose <CR>"
-- markdown to mindmap https://markmap.js.org/docs#markmap-cli
lvim.keys.normal_mode["<Leader>m"] = ":! markmap %<CR>"
-- 查看格式化和检查, 一些工具需要额外安装 https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
lvim.keys.normal_mode["<Leader>n"] = ":NullLsInfo<CR>"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- open outline
lvim.keys.normal_mode["<Leader>o"] = ":SymbolsOutline<CR>"
-- 关闭左右的 buffer, https://github.com/akinsho/bufferline.nvim 提供
lvim.keys.normal_mode["<Leader>O"] = ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>"

-- cheese 系统
lvim.keys.normal_mode["<C-f>"] = ":ObsidianQuickSwitch<CR>" -- find 快速检索
lvim.keys.normal_mode["<C-g>"] = ":ObsidianSearch<CR>" -- googd detail find 搜索全文
lvim.keys.normal_mode["<C-n>"] = ":ObsidianNew " -- new 新建节点
lvim.keys.normal_mode["<C-j>"] = ":SearchMD " -- cheese markdown 两段式搜索,
lvim.keys.normal_mode["<F4>"] = "<Plug>MarkdownPreview"

-- buggerline 的左右切换
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- 右边打开 outline, 与左边的 leader + e 对应
lvim.keys.normal_mode["<Leader>i"] = ":AerialToggle<CR>"

-- Code Action
lvim.keys.normal_mode["<C-l>"] = "<cmd>lua vim.lsp.buf.code_action()<CR>"
