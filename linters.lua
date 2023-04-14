-- set additional linters
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
