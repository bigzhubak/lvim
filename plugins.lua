lvim.plugins = {
  --{
  --  "simrat39/symbols-outline.nvim", -- 显示代码结构
  --  cmd = "SymbolsOutline",
  --},
  { 'stevearc/aerial.nvim',
    config = function() require('aerial').setup(
        {
          on_attach = function(bufnr)
            -- Toggle the aerial window with <leader>a
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>a', '<cmd>AerialToggle!<CR>', {})
            -- Jump forwards/backwards with '{' and '}'
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '{', '<cmd>AerialPrev<CR>', {})
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '}', '<cmd>AerialNext<CR>', {})
            -- Jump up the tree with '[[' or ']]'
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '[[', '<cmd>AerialPrevUp<CR>', {})
            vim.api.nvim_buf_set_keymap(bufnr, 'n', ']]', '<cmd>AerialNextUp<CR>', {})
          end
        }
      )
    end
  },
  { "bigzhu/flutter-riverpod-snippets" },
  { "ellisonleao/gruvbox.nvim" }, -- themes
  { "vimwiki/vimwiki" },
  --{ "renerocksai/telekasten.nvim" },
  --{ 'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim',
  --  config = function() require('flutter-tools').setup() end
  --},
}
require("lspconfig").vimls.setup {
  on_attach = require("aerial").on_attach,
}
