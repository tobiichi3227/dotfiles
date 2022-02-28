-- utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'

-- jk
-- vim.o.scrolloff = 8
-- vim.o.sidescrolloff = 8

-- relative number
vim.wo.number = true
vim.wo.relativenumber = true

-- highlight now line
vim.wo.cursorline = true

-- 顯示左側icon???
vim.wo.signcolumn = "yes"

-- 右側參考線？
-- vim.wo.colorcolumn = "80"

-- tab 4
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.shiftround = true

-- >> <<
-- vim.o.shiftwidth = 4
-- vim.bo.shiftwidth = 4

-- tab
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
vim.o.cindent = true
vim.bo.cindent = true

-- search
vim.o.ignorecase = true
vim.o.smartcase = true

-- search highlight
vim.o.hlsearch = true

-- 邊input邊search
vim.o.incsearch = true

-- vim mode no need
vim.o.showmode = false

-- cmd
vim.o.cmdheight = 2

-- when file be modified can autoload
vim.o.autoload = true
vim.bo.autoload = true

-- warp
vim.o.wrap = false
vim.wo.warp = false


-- mouse supply
vim.o.mouse = 'a'

-- mustn't create backup
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- updatetime
-- vim.o.updatetime = 300

-- mappings???
-- vim.o.timeoutlen = 100

-- 分割視窗從右下角出現
vim.o.splitbelow = true
vim.o.splitright = true

vim.g.completeopt = "menu,menuone,noselect,noinsert"

-- theme
vim.o.background = "dark"
-- vim.o.termgicolors = true
-- vim.opt.termgicolors = true

-- use dot to display space
vim.o.list = true
vim.o.listchars = "space:·"

-- imporve complete
vim.o.wildmenu = true

-- vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.pumheight = 10
vim.o.showtabline = 2
