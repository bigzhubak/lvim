-- Additional Plugins
-- :PackerInstall
lvim.plugins = {
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    "jose-elias-alvarez/typescript.nvim",
    config = function()
      require("typescript").setup({})
    end,
  },
  { "honza/vim-snippets" },
  -- https://github.com/LunarVim/LunarVim/issues/3153
  { "github/copilot.vim" },
  { "bigzhu/flutter-riverpod-snippets" },
  { "Neevash/awesome-flutter-snippets" },
  { "hrsh7th/vim-vsnip" },
  { "hrsh7th/vim-vsnip-integ" },
  -- TSInstall dart 使得 dart 编辑会 crash, 只能装这个来高亮 dart 代码
  {
    "akinsho/flutter-tools.nvim",
    config = function()
      require("flutter-tools").setup({
        outline = {
          open_cmd = "30vnew", -- command to use to open the outline buffer
          auto_open = true, -- if true this will open the outline automatically when it is first populated
        },
      })
    end,
  },
  { "vimwiki/vimwiki" },
  { "edluffy/hologram.nvim" },
  -- 另一个 outline
  --{
  --	"simrat39/symbols-outline.nvim",
  --	cmd = "SymbolsOutline",
  --	config = function()
  --		require("symbols-outline").setup({ auto_preview = false })
  --	end,
  --},
  -- 更好的显示代码结构,并且自动打开
  {
    "stevearc/aerial.nvim",
    config = function()
      local aerial = require("aerial")
      aerial.setup({
        attach_mode = "window",
        open_automatic = true,
        backends = { "treesitter", "lsp", "markdown" },
      })
    end,
  },
  { "ellisonleao/gruvbox.nvim" }, -- themes
  { "almo7aya/neogruvbox.nvim" }, -- themes
}
-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
lvim.lsp.on_attach_callback = function(client, bufnr)
  --require("aerial").on_attach(client, bufnr) -- 显示代码结构要 attach 到 lsp 上(说是不需要了)
end

local home = os.getenv("HOME")
vim.cmd("source " .. home .. "/.config/lvim/markdown.vim")
