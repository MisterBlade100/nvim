local a = vim.api
local g = vim.g
local o = vim.o

-- I don't belive it makes sense to split these
vim.cmd("colorscheme gruvbox")
o.clipboard = 'unnamedplus'
o.number = true
o.relativenumber = true
o.scrolloff = 8
o.splitbelow = true
o.splitright = true
o.hlsearch = false
o.termguicolors = true
o.expandtab = true
o.wrap = false
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.cindent = true
o.ignorecase = true
o.smartcase = true
o.autochdir = true
g.mapleader = ' '
g.maplocalleader = ' '

-- Makes line numbers absolute in insert mode
a.nvim_create_autocmd("InsertEnter", { command = "set norelativenumber", pattern = "*" })
a.nvim_create_autocmd("InsertLeave", { command = "set relativenumber", pattern = "*" })

-- Dashboard config
local db = require "dashboard"
db.custom_header = {
	"",
	"",
	"",
	"",
	" ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
	" ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
	" ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
	" ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
	" ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
	" ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
	"",
	"",
	"",
}
db.custom_center = {
	{
		icon = " ",
		desc = "New File            ",
		action = "DashboardNewFile",
		shortcut = "SPC o",
	},
	{
		icon = " ",
		desc = "Browse Files        ",
		action = "Telescope file_browser",
		shortcut = "SPC n",
	},
	{
		icon = " ",
		desc = "Find File           ",
		action = "Telescope find_files",
		shortcut = "SPC f",
	},
	{
		icon = " ",
		desc = "Configure Neovim    ",
		action = "edit ~/.config/nvim/lua/all",
		shortcut = "SPC v",
	},
	{
		icon = " ",
		desc = "Exit Neovim              ",
		action = "quit",
	},
}
vim.keymap.set("n", "<Leader>o", ":DashboardNewFile<CR>", { silent = true })
