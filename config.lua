lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "gruvbox"
lvim.transparent_window = true

lvim.leader = "space"

-- markdown to mindmap https://markmap.js.org/docs#markmap-cli
lvim.keys.normal_mode["<Leader>m"] = ":! markmap %<CR>"
-- 查看格式化和检查, 一些工具需要额外安装 https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
lvim.keys.normal_mode["<Leader>i"] = ":NullLsInfo<CR>"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- open outline
lvim.keys.normal_mode["<Leader>o"] = ":SymbolsOutline<CR>"
-- 关闭左右的 buffer, https://github.com/akinsho/bufferline.nvim 提供
lvim.keys.normal_mode["<Leader>O"] =
    ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>"
-- 关闭愚蠢的自动移到上下行
vim.opt.whichwrap = ""
-- fold
vim.opt.foldmethod = "indent"
-- disable auto fold
vim.opt.foldlevel = 20
-- " 输入tab 转为2个空格
vim.opt.expandtab = true
-- 设置制表符空格数
vim.opt.softtabstop = 2
-- 设置缩进空格数
vim.opt.shiftwidth = 2
-- avoid spelllang error tag chinese tag
vim.opt.spelllang = {"en", "cjk"}
-- 不要默认使用系统剪贴
vim.opt.clipboard = ""

-- 关闭自动配对补全
lvim.builtin.autopairs.active = false
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.nvimtree.setup.view.mappings = {
    list = {
        {key = "l", action = "edit"}, {key = "h", action = "edit"},
        {key = "t", action = "edit"}
    }
}

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
    "bash", "c", "javascript", "json", "lua", "python", "typescript", "tsx",
    "css", "rust", "java", "yaml"
}

lvim.builtin.treesitter.ignore_install = {"haskell"}
lvim.builtin.treesitter.highlight.enabled = true
-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
lvim.lsp.on_attach_callback = function(client, bufnr)
    require("aerial").on_attach(client, bufnr) -- 显示代码结构要 attach 到 lsp 上
    -- local function buf_set_option(...)
    --  vim.api.nvim_buf_set_option(bufnr, ...)
    -- end
    ----Enable completion triggered by <c-x><c-o>
    -- buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
end

-- Additional Plugins
lvim.plugins = {
    -- 另一个 outline
    {
        "simrat39/symbols-outline.nvim",
        cmd = "SymbolsOutline",
        config = function()
            require('symbols-outline').setup({auto_preview = false})
        end
    }, -- 更好的显示代码结构,并且自动打开
    {
        'stevearc/aerial.nvim',
        config = function()
            require('aerial').setup({
                open_automatic = true,
                backends = {"treesitter", "lsp", "markdown"}
            })
        end
    }, {"bigzhu/flutter-riverpod-snippets"}, {"ellisonleao/gruvbox.nvim"}, -- themes
    {"vimwiki/vimwiki"}, {"edluffy/hologram.nvim"}

}

local home = os.getenv("HOME")
vim.cmd('source ' .. home .. '/.config/lvim/markdown.vim')

-- how to use null-ls: https://alpha2phi.medium.com/neovim-for-beginners-lsp-using-null-ls-nvim-bd954bf86b40
-- set a formatter, this will override the language server formatting capabilities (if it exists)

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
    {filetypes = {"go"}, command = "gofmt"}, {
        filetypes = {
            "javascriptreact", "javascript", "typescriptreact", "typescript",
            "vue"
        },
        command = "eslint"
    }, {filetypes = {"markdown", "vimwiki"}, command = "remark"},
    {filetypes = {"sh"}, command = "shellharden"},
    {filetypes = {"lua"}, command = "lua_format"},
    {filetypes = {"python"}, command = "autopep8"}
}

-- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
    {filetypes = {"go"}, command = "golangci_lint"}, {
        filetypes = {
            "javascriptreact", "javascript", "typescriptreact", "typescript",
            "vue"
        },
        command = "eslint"
    }, {filetypes = {"json"}, command = "jsonlint"},
    {filetypes = {"sh"}, command = "shellcheck"}
    -- { filetypes = { "lua" }, command = "luacheck" },
}

local code_actions = require "lvim.lsp.null-ls.code_actions"
code_actions.setup {
    {filetypes = {"markdown", "tex"}, command = "proselint", args = {"--json"}},
    {filetypes = {"sh"}, command = "shellcheck"},
    {filetypes = {"lua", "dart", "python", "go"}, command = "refactoring"}
}
