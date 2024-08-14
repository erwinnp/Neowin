local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

local option = {
	ensure_installed = {
		"comment",
		"markdown",
		"markdown_inline",
		"lua",
		"javascript",
		"tsx",
		"typescript",
		"html",
		"json",
		"css",
	},
	auto_install = true,
	autopairs = { enable = true },
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	markdown = {
		enable = true,
		additional_vim_regex_highlighting = false,
		parse = {
			inline = { "markdown_inline" },
		},
	},
	markdown_inline = { enable = true },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
		config = {
			tsx = {
				jsx_element = {
					__default = "{/* %s */}",
					__parent = {
						parenthesized_expression = "// %s",
					},
				},
			},
			javascript = {
				__default = "// %s",
				jsx_element = "{/* %s */}",
				jsx_fragment = "{/* %s */}",
				jsx_attribute = "// %s",
				comment = "// %s",
				__parent = {
					jsx_expression = "// %s",
				},
			},
		},
	},
}

treesitter.setup(option)
