-- Additional Plugins
-- :Lazy
-- :Lazy update
local home = os.getenv("HOME")
lvim.plugins = {
	{ "vim-scripts/plsql.vim" },
	{ "github/copilot.vim" }, -- copilot
	-- { "Exafunction/codeium.vim" }, -- codeium
	{ -- obsidian
		"epwalsh/obsidian.nvim",
		config = function()
			require("obsidian").setup({
				dir = "~/cheese",
				note_id_func = function(title)
					return title
				end,
			})
		end,
	},
	{ -- 让 markdown 中的代码块也能用上 lsp
		"AckslD/nvim-FeMaco.lua",
		config = function()
			require("femaco").setup()
		end,
	},
	{
		"jakewvincent/mkdnflow.nvim",
		config = function()
			require("mkdnflow").setup({
				links = {
					style = "markdown",
					name_is_source = true,
					conceal = true,
					context = 0,
					implicit_extension = nil,
					transform_implicit = false,
					transform_explicit = false,
				},
				mappings = {
					MkdnFoldSection = { "n", "<leader>q" },
				},
			})
		end,
	},
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		init = function()
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
	--{
	--	"codota/tabnine-nvim",
	--	build = "./dl_binaries.sh",
	--	config = function()
	--		require("tabnine").setup({
	--			disable_auto_comment = true,
	--			accept_keymap = "<Tab>",
	--			dismiss_keymap = "<C-]>",
	--			debounce_ms = 300,
	--			suggestion_color = { gui = "#808080", cterm = 244 },
	--			execlude_filetypes = { "TelescopePrompt" },
	--		})
	--	end,
	--},
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
	--{ "vimwiki/vimwiki" },
	{ "edluffy/hologram.nvim" },
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
	--{ "ellisonleao/gruvbox.nvim" }, -- themes
	{ "morhetz/gruvbox" }, -- themes
	--{ "sainnhe/gruvbox-material" }, -- themes
	--{ "almo7aya/neogruvbox.nvim" }, -- themes
	--{ "lifepillar/vim-gruvbox8" },
	--{ "luisiacc/gruvbox-baby" },
	--{ "rebelot/kanagawa.nvim" },
}
-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
lvim.lsp.on_attach_callback = function(client, bufnr) end

vim.cmd("source " .. home .. "/.config/lvim/markdown.vim")
