-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")
local snacks = require("snacks")

local function map(mode, lhs, rhs, opts, overwrite)
    local keys = require("lazy.core.handler").handlers.keys
    ---@cast keys LazyKeysHandler
    -- do not create the keymap if a lazy keys handler exists
    if overwrite or not keys.active[keys.parse({ lhs, mode = mode }).id] then
        opts = opts or {}
        opts.silent = opts.silent ~= false
        vim.keymap.set(mode, lhs, rhs, opts)
    end
end

local function remove(mode, lhs, rhs, opts)
    vim.keymap.del(mode, lhs, opts)
end

-- remove default setttings
remove("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
remove("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
remove("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
remove("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })
remove("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
remove("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
remove("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
remove("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
remove("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
remove("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
remove("n", "<leader>n", function() snacks.notifer.show_history() end, { desc = "Notification History" })
-- remove("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
-- remove("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
-- remove("n", "<leader>gg", function()
--   Util.terminal.open({ "lazygit" }, { cwd = Util.root.get() })
-- end, { desc = "Lazygit (root dir)" })
-- remove("n", "<leader>-", "<C-W>s", { desc = "Split window below" })
-- remove("n", "<leader>|", "<C-W>v", { desc = "Split window right" })
-- remove("n", "<leader>ww", "<C-W>p", { desc = "Other window" })
-- remove("n", "<leader>wd", "<C-W>c", { desc = "Delete window" })
-- remove("n", "<leader>w-", "<C-W>s", { desc = "Split window below" })
-- remove("n", "<leader>w|", "<C-W>v", { desc = "Split window right" })
-- remove("n", "<leader>-", "<C-W>s", { desc = "Split window below" })
-- remove("n", "<leader>|", "<C-W>v", { desc = "Split window right" })

map("i", "jj", "<ESC>", { desc = "Escape Insert Mode" })
map("i", "jk", "<ESC>", { desc = "JK好香" })
map("v", "v", "<ESC>", { desc = "Escape Visual Mode" })
map("n", "H", "0", { desc = "" })
map("v", "H", "0", { desc = "" })
map("n", "L", "$", { desc = "" })
map("v", "L", "$", { desc = "" })
map("n", "<leader>s", ":nohlsearch<CR>", { desc = "Clear hlsearch" })
map("v", "<leader>y", [["+y]], { desc = "Copy select section to system clipboard" })
map("n", "<leader>p", [["+p]], { desc = "Paste from system clipboard" })
map("n", "<C-q>", ":bd<CR>", { desc = "Close buffer like web browser" })
map("v", "i1", "<esc>`>a)<esc>`<i(<esc>", { desc = "" })
map("v", "i2", "<esc>`>a]<esc>`<i[<esc>", { desc = "" })
map("v", "i3", "<esc>`>a}<esc>`<i{<esc>", { desc = "" })
map("v", "i4", '<esc>`>a"<esc>`<i"<esc>', { desc = "" })
map("v", "i5", "<esc>`>a'<esc>`<i'<esc>", { desc = "" })
map("v", "i6", "<esc>`>a`<esc>`<i`<esc>", { desc = "" })
map("v", "i7", "<esc>`>a><esc>`<i<<esc>", { desc = "" })
map("n", ";", ":", { desc = "" })
map("n", "<C-h>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Prev buffer" })
map("n", "<C-l>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
map("n", "<leader>lg", function()
    snacks.lazygit.open({ cwd = Util.root.get() })
end, { desc = "Lazygit (root dir)" })
map("n", "<leader>ww", "<C-W>p", { desc = "Other window" })
map("n", "so", "<C-W>o", { desc = "Delete other window" })
map("n", "sh", ":sp<CR>", { desc = "Split window below" })
map("n", "sv", ":vsp<CR>", { desc = "Split window right" })
map("n", "<A-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<A-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<A-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<A-l>", "<C-w>l", { desc = "Go to right window" })
map("n", "<leader>um", ":lua require'cmp'.setup.buffer { enabled = false }<CR>", { desc = "Toggle Completion" })

map("n", "<C-S-UP>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<C-S-DOWN>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<C-S-UP>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<C-S-DOWN>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<C-S-UP>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
map("v", "<C-S-DOWN>", ":m '>+1<cr>gv=gv", { desc = "Move down" })

map("n", "<leader>n", function()
    require("neo-tree.command").execute({ toggle = true, dir = require("lazyvim.util").root.get() })
end, { desc = "Explorer NeoTree (root dir)" }, true)

-- map("i", "<C-p>", "<Up>", { desc = "Emacs keymap" })
-- map("i", "<C-n>", "<Down>", { desc = "Emacs keymap" })
-- map("i", "<C-a>", "<Home>", { desc = "Emacs keymap" })
-- map("i", "<C-e>", "<End>", { desc = "Emacs keymap" })
-- map("i", "<C-b>", "<Left>", { desc = "Emacs keymap" })
-- map("i", "<C-f>", "<Right>", { desc = "Emacs keymap" })
-- map("i", "<C-d>", "<Del>", { desc = "Emacs keymap" })
-- map("i", "<A-x>", "<ESC>:", { desc = "Emacs keymap" })
-- map("n", "<A-x>", ":", { desc = "Emacs keymap" })
