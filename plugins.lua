lvim.plugins = {
  { "vimwiki/vimwiki" },
  { "renerocksai/telekasten.nvim" },
  { 'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim',
    config = function() require('flutter-tools').setup() end
  },
}
