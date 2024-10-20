-- vim.opt.number = true
-- vim.opt.ignorecase = true
-- vim.opt.smartcase = true
-- vim.opt.hlsearch = false
-- vim.opt.modeline = false
-- vim.opt.wrap = true
-- vim.opt.breakindent = true
-- vim.opt.tabstop = 4
-- vim.opt.shiftwidth = 2
-- vim.opt.expandtab = false

-- vim.keymap.set('n', '<leader>w', '<cmd>write<cr>', {desc = 'Save'}) -- use <space>w to save file
-- vim.keymap.set('n', '<leader>q', '<cmd>quit<cr>', {desc = 'Save'}) -- use <space>q to exit vim
-- vim.keymap.set('n', '<leader>wq', '<cmd>wq<cr>', {desc = 'Save'}) -- use <space>q to exit vim
-- vim.keymap.set({'n', 'x'}, 'gy', '"+y') -- use gy to copy to clipbofsasafasfrd
-- vim.keymap.set({'n', 'x'}, 'gp', '"+p') -- use gp to paste from clipboard 

-- vim.keymap.set({'n', 'x'}, 'x', '"_x') -- delete without storing in register
-- vim.keymap.set({'n', 'x'}, 'X', '"_d') -- delete without storing in register

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

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import/override with your plugins
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

-- make nvim transparent as the root terminal is
vim.cmd([[highlight normal ctermbg=none]])
vim.cmd([[highlight nontext ctermbg=none]])
vim.cmd([[highlight normal guibg=none]])
vim.cmd([[highlight nontext guibg=none]])

