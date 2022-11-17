lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "neogruvbox"
lvim.transparent_window = true
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
-- 更好的错误提示，关闭原本的错误提示
lvim.lsp.diagnostics.virtual_text = false
-- 光标落上去时候自动显示 diagnostic
lvim.lsp.diagnostics.float = true
-- bufferline 只显示 tab
--lvim.builtin.bufferline.options.mode = "tabs"
-- 这里必须手工设置为 nil, 否则 mode 为 tabs 时会报错
--lvim.builtin.bufferline.options.custom_filter = nil

require("luasnip.loaders.from_vscode").lazy_load()
