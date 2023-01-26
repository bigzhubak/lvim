-- 关闭自动配对补全
lvim.builtin.autopairs.active = false

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
-- 关闭愚蠢的下划线插件, 改回 Visual 高亮
lvim.builtin.illuminate.active = true
lvim.builtin.illuminate.on_config_done = function(illuminate)
	vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
	vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
	vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
end

lvim.builtin.terminal.active = true

lvim.builtin.nvimtree.setup.view.width = 44
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.open_on_tab = true
lvim.builtin.nvimtree.setup.filters = {
	dotfiles = false, --show dotfiles
	custom = { "*.ex5" }, -- for mql5 dev, 隐藏编译后文件
}
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

-- 在 tabnew 打开时候, 始终保持 nvimtree 打开
local nt_api = require("nvim-tree.api")
local tree_open = false
local function tab_enter()
	if tree_open then
		nt_api.tree.open()
		vim.api.nvim_command("wincmd p")
	else
		nt_api.tree.close()
	end
end

nt_api.events.subscribe(nt_api.events.Event.TreeOpen, function()
	tree_open = true
end)
nt_api.events.subscribe(nt_api.events.Event.TreeClose, function()
	tree_open = false
end)
vim.api.nvim_create_autocmd("TabEnter,TabNewEnter", { callback = tab_enter })

lvim.builtin.nvimtree.setup.view.mappings = {
	list = {
		{ key = "l", action = "tabnew" },
		{ key = "h", action = "tabnew" },
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
