vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.textwidth = 60
vim.opt.formatoptions:append("t")
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = true
vim.opt.signcolumn = "yes"
vim.opt.hlsearch = true
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 1
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 4

vim.opt.mouse = "a"
vim.opt.swapfile = false
vim.opt.list = false

vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.backspace = "start,eol,indent"

vim.opt.cursorline = false
vim.opt.termguicolors = true

local built_ins = {
	"2html_plugin",
	"getscript",
	"getscriptPlugin",
	"gzip",
	"logipat",
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"matchit",
	"tar",
	"tarPlugin",
	"rrhelper",
	"spellfile_plugin",
	"vimball",
	"vimballPlugin",
	"zip",
	"zipPlugin",
}

for _, plugin in pairs(built_ins) do
	vim.g["loaded_" .. plugin] = 1
end
