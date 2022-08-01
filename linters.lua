-- set additional linters
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
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
})
