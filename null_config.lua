-------------------------------------------------------------------------------------- formatters
-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
-- :LspInstall dart
-- :TSInstall all
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
			"vimwiki",
			"graphql",
			"json",
		},
		command = "prettier",
	},
	{ filetypes = { "markdown" }, command = "prettier" }, -- 不能和上面并在一起, 会无法生效
	{ filetypes = { "zsh" }, command = "shfmt" }, -- brew install shfmt
	{ filetypes = { "lua" }, command = "stylua" },
	{ filetypes = { "python" }, command = "autopep8" }, -- brew install autopep8
	{ filetypes = { "sql" }, command = "pg_format" },
	{ filetypes = { "toml" }, command = "taplo" }, -- cargo install taplo-cli --locked
})

-------------------------------------------------------------------------------------- linters
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{
		command = "codespell",
		---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
		filetypes = { "javascript", "python" },
	},
	{ filetypes = { "less" }, command = "stylelint" },
	{ filetypes = { "go" }, command = "golangci_lint" },
	{
		filetypes = {
			"javascriptreact",
			"javascript",
			"typescriptreact",
			"typescript",
			"vue",
		},
		command = "eslint",
	},
	{ filetypes = { "json" }, command = "jsonlint" },
	{ filetypes = { "sh" }, command = "shellcheck" },
	-- { filetypes = { "lua" }, command = "luacheck" },
	{ filetypes = { "sql" }, command = "sqlfluff", args = { "--dialect", "postgres" } },
})

-------------------------------------------------------------------------------------- code_actions
local code_actions = require("lvim.lsp.null-ls.code_actions")
code_actions.setup({
	{ filetypes = { "markdown", "tex" }, command = "proselint", args = { "--json" } },
	{ filetypes = { "sh" }, command = "shellcheck" },
	{ filetypes = { "lua", "dart", "python", "go" }, command = "refactoring" },
})
