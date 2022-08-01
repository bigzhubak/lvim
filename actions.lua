local code_actions = require("lvim.lsp.null-ls.code_actions")
code_actions.setup({
	{ filetypes = { "markdown", "tex" }, command = "proselint", args = { "--json" } },
	{ filetypes = { "sh" }, command = "shellcheck" },
	{ filetypes = { "lua", "dart", "python", "go" }, command = "refactoring" },
})
