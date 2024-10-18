vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 2
vim.opt.expandtab = false

vim.g.mapleader = ' '


vim.keymap.set('n', '<leader>w', '<cmd>write<cr>', {desc = 'Save'}) -- use <space>w to save file
vim.keymap.set('n', '<leader>q', '<cmd>quit<cr>', {desc = 'Save'}) -- use <space>q to exit vim
vim.keymap.set({'n', 'x'}, 'gy', '"+y') -- use gy to copy to clipboard
vim.keymap.set({'n', 'x'}, 'gp', '"+p') -- use gp to paste from clipboard 

vim.keymap.set({'n', 'x'}, 'x', '"_x') -- delete without storing in register
vim.keymap.set({'n', 'x'}, 'X', '"_d') -- delete without storing in register

-- vim.opt.highlight Normal ctermbg=none
-- vim.opt.highlight NonText ctermbg=none
-- vim.opt.highlight Normal guibg=none
-- vim.opt.highlight NonText guibg=none
