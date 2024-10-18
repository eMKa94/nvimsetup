-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 2
vim.opt.expandtab = false

vim.keymap.set('n', '<leader>w', '<cmd>write<cr>', {desc = 'Save'}) -- use <space>w to save file
vim.keymap.set('n', '<leader>q', '<cmd>quit<cr>', {desc = 'Save'}) -- use <space>q to exit vim
vim.keymap.set('n', '<leader>wq', '<cmd>wq<cr>', {desc = 'Save'}) -- use <space>q to exit vim
vim.keymap.set({'n', 'x'}, 'gy', '"+y') -- use gy to copy to clipbofsasafasfrd
vim.keymap.set({'n', 'x'}, 'gp', '"+p') -- use gp to paste from clipboard 

vim.keymap.set({'n', 'x'}, 'x', '"_x') -- delete without storing in register
vim.keymap.set({'n', 'x'}, 'X', '"_d') -- delete without storing in register

-- Make nvim transparent as the root terminal is
vim.cmd([[highlight Normal ctermbg=none]])
vim.cmd([[highlight NonText ctermbg=none]])
vim.cmd([[highlight Normal guibg=none]])
vim.cmd([[highlight NonText guibg=none]])

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
