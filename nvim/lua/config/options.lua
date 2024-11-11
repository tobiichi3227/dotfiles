-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mapleader = ","

local opt = vim.opt

opt.shiftwidth = 4
opt.tabstop = 4
opt.clipboard = ""
opt.foldmethod = "manual"
vim.o.softtabstop = 4
vim.g.loaded_netrwPlugin = 0
vim.g.loaded_netrw = 0

vim.cmd([[
    set guicursor=n-c-v:block-nCursor
]])

-- vim.go.lazyredraw = true

-- if vim.g.neovide then
--   vim.g.neovide_scale_factor = 1.2
--   vim.g.neovide_scroll_animation_length = 0
--   vim.g.neovide_refresh_rate = 60
--   vim.o.guifont = "Hack Nerd Font:18"
-- end
