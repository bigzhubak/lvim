--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "gruvbox"
lvim.transparent_window = true
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

lvim.keys.normal_mode["<Leader>m"] = ":! markmap %<CR>"
-- 查看格式化和检查, 一些工具需要额外安装 https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
lvim.keys.normal_mode["<Leader>i"] = ":NullLsInfo<CR>"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- open outline
lvim.keys.normal_mode["<Leader>o"] = ":SymbolsOutline<CR>"
-- 关闭左右的 buffer, https://github.com/akinsho/bufferline.nvim 提供
lvim.keys.normal_mode["<Leader>O"] = ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>"
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
-- avoid spelllang error tag chinese tag
vim.opt.spelllang = { "en", "cjk" }
-- 不要默认使用系统剪贴
vim.opt.clipboard = ""

-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
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
    { key = "l", action = "edit" },
    { key = "h", action = "edit" },
    { key = "t", action = "edit" },
  },
}

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
  "dart",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumeko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- vim.tbl_map(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
lvim.lsp.on_attach_callback = function(client, bufnr)
  require("aerial").on_attach(client, bufnr) --显示代码结构要 attach 到 lsp 上
  --local function buf_set_option(...)
  --  vim.api.nvim_buf_set_option(bufnr, ...)
  --end
  ----Enable completion triggered by <c-x><c-o>
  --buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
end



-- Additional Plugins
lvim.plugins = {
  -- 另一个 outline
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    config = function() require('symbols-outline').setup(
        {
          auto_preview = false,
        }
      )
    end
  },
  -- 更好的显示代码结构,并且自动打开
  { 'stevearc/aerial.nvim',
    config = function() require('aerial').setup(
        {
          open_automatic = true,
          backends = { "treesitter", "lsp", "markdown" },
        }
      )
    end
  },
  { "bigzhu/flutter-riverpod-snippets" },
  { "ellisonleao/gruvbox.nvim" }, -- themes
  { "vimwiki/vimwiki" },
  --{"folke/tokyonight.nvim"},
  --{
  --  "folke/trouble.nvim",
  --  cmd = "TroubleToggle",
  --},
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })

local home = os.getenv("HOME")
vim.cmd('source ' .. home .. '/.config/lvim/markdown.vim')

-- how to use null-ls: https://alpha2phi.medium.com/neovim-for-beginners-lsp-using-null-ls-nvim-bd954bf86b40
-- set a formatter, this will override the language server formatting capabilities (if it exists)


local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { filetypes = { "javascriptreact", "javascript", "typescriptreact", "typescript", "vue" }, command = "eslint" },
  { filetypes = { "markdown", "vimwiki" }, command = "remark" },
  { filetypes = { "sh" }, command = "shellharden" },
  { filetypes = { "lua" }, command = "lua_format" },
  { filetypes = { "python" }, command = "autopep8" },
  { filetypes = { "dart" }, command = "dart_format" },
}

-- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { filetypes = { "javascriptreact", "javascript", "typescriptreact", "typescript", "vue", }, command = "eslint" },
  { filetypes = { "json" }, command = "jsonlint" },
  { filetypes = { "sh" }, command = "shellcheck" },
  --{ filetypes = { "lua" }, command = "luacheck" },
}

local code_actions = require "lvim.lsp.null-ls.code_actions"
code_actions.setup {
  { filetypes = { "markdown", "tex" }, command = "proselint", args = { "--json" } },
  { filetypes = { "sh" }, command = "shellcheck" },
  { filetypes = { "lua" }, command = "refactoring" },
}
