lvim.plugins = {
  --{
  --  "simrat39/symbols-outline.nvim", -- 显示代码结构
  --  cmd = "SymbolsOutline",
  --},
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
  { "bigzhu/vimwiki" },
  --{ "renerocksai/telekasten.nvim" },
  --{ 'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim',
  --  config = function() require('flutter-tools').setup() end
  --},
}

--显示代码结构要 attach 到 lsp 上
lvim.lsp.on_attach_callback = function(client, bufnr)
  require("aerial").on_attach(client, bufnr)
end
