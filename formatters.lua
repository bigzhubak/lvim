-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
-- :LspInstall dart
-- :TSInstall dart
-- space n  show null info
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ filetypes = { "kotlin" }, command = "ktlint" }, -- brew install ktlint
	{ filetypes = { "go" }, command = "gofmt" },
	{
		filetypes = {
			"javascriptreact",
			"javascript",
			"typescriptreact",
			"typescript",
			"vue",
			"html",
		},
		command = "prettier",
	},
	{ filetypes = { "markdown", "vimwiki", "graphql", "json" }, command = "prettier" },
	{ filetypes = { "zsh" }, command = "shfmt" }, -- brew install shfmt
	{ filetypes = { "lua" }, command = "stylua" },
	{ filetypes = { "python" }, command = "autopep8" }, -- brew install autopep8
	{ filetypes = { "sql" }, command = "pg_format" },
})
