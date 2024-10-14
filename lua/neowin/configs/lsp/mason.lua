local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

mason.setup()

local status_ok, masonlsp = pcall(require, "mason-lspconfig")
if not status_ok then
	return
end

masonlsp.setup({
	automatic_installation = true,
	ensure_installed = {
		"cssls",
		"eslint",
		"html",
		"jsonls",
		"ts_ls",
		"tailwindcss",
	},
})

local status_ok, masontool = pcall(require, "mason-tool-installer")
if not status_ok then
	return
end

masontool.setup({
	ensure_installed = {
		"prettier",
		"stylua",
		"eslint_d",
	},
})
