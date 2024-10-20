function map(mode, shortcut, command)
	if type(command) == "string" then
		vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
	else
		print("Error: Command must be a string")
	end
end

function short(mode, shortcut, command)
	vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = false })
end

-- normal mode
function nmap(shortcut, command)
	map("n", shortcut, command)
end
-- insert mode
function imap(shortcut, command)
	map("i", shortcut, command)
end
-- visual mode
function vmap(shortcut, command)
	map("v", shortcut, command)
end

-- disable default keymaps
nmap("<up>", "<Nop>")
nmap("<left>", "<Nop>")
nmap("<right>", "<Nop>")
nmap("<down>", "<Nop>")
nmap("<C-z>", "<Nop>")

-- general keymaps
nmap(";", ":")
imap("jj", "<Esc>")
nmap("<C-s>", "<cmd>w<CR>")
nmap("<C-h>", "<C-w>h")
nmap("<C-l>", "<C-w>l")
vmap("<S-j>", ":m '>+1<CR>gv=gv")
vmap("<S-k>", ":m '<-2<CR>gv=gv")

-- neotree
nmap("<C-n>", ":Neotree filesystem reveal right toggle<CR>")

-- barbar
nmap("<leader>x", "<Cmd>BufferClose<CR>")
nmap("<S-tab>", "<Cmd>BufferPrevious<CR>")
nmap("<Tab>", "<Cmd>BufferNext<CR>")

-- Diagnostics
nmap("<C-j>", function()
	vim.diagnostic.goto_next()
end)
