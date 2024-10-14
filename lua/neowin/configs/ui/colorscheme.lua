local status_ok, kanagawa = pcall(require, "kanagawa")
if not status_ok then
	return
end

local options = {
	undercurl = true,
	commentStyle = { italic = true },
	keywordStyle = { italic = false },
	transparent = true,
	dimInactive = false,
	terminalColors = true,
	theme = "wave",
}

kanagawa.setup(options)

vim.cmd("colorscheme kanagawa")
vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
vim.cmd("highlight LineNr guibg=NONE ctermbg=NONE")
vim.cmd.highlight("IndentLine guifg=#54546D")
vim.cmd.highlight("IndentLineCurrent guifg=#DCA561")
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.cmd([[
  hi DiagnosticSignError guibg=NONE
  hi DiagnosticSignWarn guibg=NONE
  hi DiagnosticSignHint guibg=NONE
  hi DiagnosticSignInfo guibg=NONE
]])
