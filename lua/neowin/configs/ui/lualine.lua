local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local kanagawa_colors = {
	crystalBlue = "#7E9CD8",
	springGreen = "#98BB6C",
	oniViolet = "#957FB8",
	autumnRed = "#C34043",
	boatYellow2 = "#E6C384",
	fujiGray = "#727169",
	fujiWhite = "#DCD7BA",
}

local transparent_theme = {
	normal = {
		a = { fg = kanagawa_colors.crystalBlue, bg = "NONE", gui = "bold" },
		b = { fg = kanagawa_colors.fujiWhite, bg = "NONE" },
		c = { fg = kanagawa_colors.fujiWhite, bg = "NONE" },
	},
	insert = {
		a = { fg = kanagawa_colors.springGreen, bg = "NONE", gui = "bold" },
	},
	visual = {
		a = { fg = kanagawa_colors.oniViolet, bg = "NONE", gui = "bold" },
	},
	replace = {
		a = { fg = kanagawa_colors.autumnRed, bg = "NONE", gui = "bold" },
	},
	command = {
		a = { fg = kanagawa_colors.boatYellow2, bg = "NONE", gui = "bold" },
	},
	inactive = {
		a = { fg = kanagawa_colors.fujiGray, bg = "NONE" },
		b = { fg = kanagawa_colors.fujiGray, bg = "NONE" },
		c = { fg = kanagawa_colors.fujiGray, bg = "NONE" },
	},
}

lualine.setup({
	options = {
		theme = transparent_theme,
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
		globalstatus = true,
		disabled_filetypes = {
			statusline = { "alpha", "TelescopePrompt", "neo-tree", "mason", "lspinfo" },
			winbar = {},
		},
	},
	sections = {
		lualine_a = {
			{
				"mode",
				fmt = function(str)
					local mode_map = {
						["NORMAL"] = "N",
						["INSERT"] = "I",
						["VISUAL"] = "V",
						["V-LINE"] = "V-LINE",
						["V-BLOCK"] = "V-BLOCK",
						["REPLACE"] = "R",
						["COMMAND"] = "C",
						["TERMINAL"] = "T",
					}
					return mode_map[str] or str
				end,
				color = { fg = kanagawa_colors.crystalBlue, bg = kanagawa_colors.sumiInk1 },
			},
		},
		lualine_b = {
			{ "branch", icon = "", color = { fg = kanagawa_colors.springBlue, bg = kanagawa_colors.sumiInk1 } },
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				sections = { "error", "warn", "info", "hint" },
				diagnostics_color = {
					error = { fg = kanagawa_colors.autumnRed },
					warn = { fg = kanagawa_colors.autumnYellow },
					info = { fg = kanagawa_colors.waveBlue2 },
					hint = { fg = kanagawa_colors.springViolet1 },
				},
			},
		},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {
			{ "filetype", color = { fg = kanagawa_colors.fujiWhite, bg = kanagawa_colors.sumiInk1 } },
		},
		lualine_z = {
			{ "filename", path = 1, color = { fg = kanagawa_colors.fujiWhite, bg = kanagawa_colors.sumiInk1 } },
			{ "lsp_progress", color = { fg = kanagawa_colors.springBlue, bg = kanagawa_colors.sumiInk1 } },
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {
			{ "filename", path = 1, color = { fg = kanagawa_colors.fujiWhite, bg = kanagawa_colors.sumiInk1 } },
		},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	extensions = { "nvim-tree", "fugitive" },
})
