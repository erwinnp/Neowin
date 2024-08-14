local status_ok, neotree = pcall(require, "neo-tree")
if not status_ok then
	return
end

local options = {
	filesystem = {
		filtered_items = {
			visible = true,
		},
	},
	window = {
		position = "right",
		width = 26,
		mappings = {
			["d"] = "delete",
			["r"] = "rename",
			["y"] = "copy_to_clipboard",
			["x"] = "cut_to_clipboard",
			["p"] = "paste_from_clipboard",
			["c"] = "copy",
			["m"] = "move",
			["q"] = "close_window",
		},
	},
	source_selector = {
		winbar = false,
		statusline = false,
	},
}

neotree.setup(options)
