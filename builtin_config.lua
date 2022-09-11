-- 关闭自动配对补全
lvim.builtin.autopairs.active = false

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"

lvim.builtin.notify.active = true

lvim.builtin.terminal.active = true

lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.open_on_tab = true
lvim.builtin.nvimtree.setup.filters = {
  dotfiles = false, --show dotfiles
  custom = { "*.ex5" }, -- for mql5 dev, 隐藏编译后文件
}
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.nvimtree.setup.view.mappings = {
  list = {
    { key = "l", action = "edit" },
    { key = "h", action = "edit" },
    { key = "t", action = "tabnew" },
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
}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
