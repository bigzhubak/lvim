-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ filetypes = { "go" }, command = "gofmt" },
	{
		filetypes = {
			"javascriptreact",
			"javascript",
			"typescriptreact",
			"typescript",
			"vue",
		},
		command = "prettier",
	},
	{ filetypes = { "markdown", "vimwiki" }, command = "prettier" },
	{ filetypes = { "sh" }, command = "shellharden" },
	{ filetypes = { "lua" }, command = "stylua" },
	{ filetypes = { "python" }, command = "autopep8" },
})
