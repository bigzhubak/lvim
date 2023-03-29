lvim.log.level = "warn"
lvim.format_on_save = true
-- lvim.colorscheme = "neogruvbox"
lvim.colorscheme = "gruvbox"
lvim.transparent_window = true

-- 更好的错误提示，关闭原本的错误提示
lvim.lsp.diagnostics.virtual_text = false
-- 光标落上去时候自动显示 diagnostic
lvim.lsp.diagnostics.float = false

-- bufferline 只显示 tab
lvim.builtin.bufferline.options.mode = "tabs"
-- 这里必须手工设置为 nil, 否则 mode 为 tabs 时会报错
--lvim.builtin.bufferline.options.custom_filter = nil

require("luasnip.loaders.from_vscode").lazy_load()
vim.api.nvim_set_hl(0, "CursorLine", { underline = true, default = true })
