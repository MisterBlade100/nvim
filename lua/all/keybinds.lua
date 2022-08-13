local autocmd = vim.api.nvim_create_autocmd

local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- Fix n and N. Keeping cursor in center
map('n', 'n', 'nzz')
map('n', 'N', 'Nzz')

-- Quickly save the current buffer or all buffers
map('n', '<leader>w', ':update<CR>')
map('n', '<leader>W', ':wall<CR>')

-- leader-o/O inserts blank line below/above
map('n', '<leader>o', 'o<ESC>')
map('n', '<leader>O', 'O<ESC>')

-- leader-s deletes text but keeps line
map('n', '<leader>s', 'S<ESC>')

-- Global substitute
map('n', '<C-z>', ':%s//g<left><left>')

-- New tab
map('n', '<C-t>', ':tabnew<CR>')

-- Navigate buffers
map('n', '<leader>j', ':bp<CR>')
map('n', '<leader>k', ':bp<CR>')

-- Diagnostics
map('n', '<leader>d', vim.diagnostic.open_float)

-- leader-b/r to build and run
local lang_maps = {
	cpp = { build = "g++ % -o %:r", run = "./%:r" },
	typescript = { build = "deno compile %", run = "deno run %" },
	javascript = { build = "deno compile %", run = "deno run %" },
	python = { run = "python %" },
	java = { build = "javac %", run = "java %:r" },
	sh = { run = "./%" },
	go = { build = "go build", run = "go run %" },
	rust = { run = "cargo run" },
	arduino = {
		build = "arduino-cli compile --fqbn arduino:avr:uno %:r",
		run = "arduino-cli upload -p /dev/ttyACM0 --fqbn arduino:avr:uno %:r",
	},
}
for lang, data in pairs(lang_maps) do
	if data.build ~= nil then
		vim.api.nvim_create_autocmd(
			"FileType",
			{ command = "nnoremap <Leader>b :!" .. data.build .. "<CR>", pattern = lang }
		)
	end
	vim.api.nvim_create_autocmd(
		"FileType",
		{ command = "nnoremap <Leader>r :split<CR>:terminal " .. data.run .. "<CR>", pattern = lang }
	)
end
