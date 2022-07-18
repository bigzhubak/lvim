lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "gruvbox"
lvim.transparent_window = true

lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
    "bash", "c", "javascript", "json", "lua", "python", "typescript", "tsx",
    "css", "rust", "java", "yaml"
}

lvim.builtin.treesitter.ignore_install = {"haskell"}
lvim.builtin.treesitter.highlight.enabled = true

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
    {
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
    {
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
    {filetypes = {"lua", "dart", "python"}, command = "refactoring"}
}
