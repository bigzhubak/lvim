-- 关闭愚蠢的自动移到上下行
vim.opt.whichwrap = ""
-- fold
vim.opt.foldmethod = "indent"
-- disable auto fold
vim.opt.foldlevel = 20
-- " 输入tab 转为2个空格
vim.opt.expandtab = true
-- 设置制表符空格数
vim.opt.softtabstop = 2
-- 设置缩进空格数
vim.opt.shiftwidth = 2
-- avoid spelllang error tag chinese tag
vim.opt.spelllang = { "en", "cjk" }
-- 不要默认使用系统剪贴
-- vim.opt.clipboard = ""

-- 光标落上去显示错误信息
-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
vim.o.updatetime = 250
vim.cmd([[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
--
vim.opt.wrap = true
-- 开启 copilot tab 映射
--vim.g.copilot_filetypes = { markdown = true, gitcommit = true, yaml = true }
vim.g.copilot_filetypes = { ["*"] = true }
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""
local cmp = require("cmp")

lvim.builtin.cmp.mapping["<C-e>"] = function(fallback)
	cmp.mapping.abort()
	local copilot_keys = vim.fn["copilot#Accept"]()
	if copilot_keys ~= "" then
		vim.api.nvim_feedkeys(copilot_keys, "i", true)
	else
		fallback()
	end
end

lvim.builtin.cmp.mapping["<Tab>"] = function(fallback)
	if cmp.visible() then
		cmp.select_next_item()
	else
		local copilot_keys = vim.fn["copilot#Accept"]()
		if copilot_keys ~= "" then
			vim.api.nvim_feedkeys(copilot_keys, "i", true)
		else
			fallback()
		end
	end
end

-- reaplce copilot highlight
lvim.autocommands = {
	{
		{ "ColorScheme" },
		{
			pattern = "*",
			callback = function()
				vim.api.nvim_set_hl(0, "CopilotSuggestion", { ctermfg = 8, fg = "#954d00" })
			end,
		},
	},
}
