-- leader key = ,
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- local variables
local pluginKeys = {}
local map = vim.keymap.set
local opt = {
    noremap = true,
    silent = true
}

map("i", "jj", "<ESC>", opt)
map("i", "jk", "<ESC>", opt) -- jk 好香(沒)
map("v", "v", "<ESC>", opt)
map("n", "H", "0", opt)
map("v", "H", "0", opt)
map("n", "L", "$", opt)
map("v", "L", "$", opt)
map("n", "<leader>h", "^", opt)
map("n", "<leader>l", "g_", opt)
map("v", "<leader>h", "^", opt)
map("v", "<leader>l", "g_", opt)

-- visual mode indent
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)

-- magic search
map("n", "/", "/\\v", { noremap = true, silent = false })
map("v", "/", "/\\v", { noremap = true, silent = false })

-- no hlsearch
map("n", "<leader>s", ":nohlsearch<CR>", opt)

-- alt + hjkl jump to windows
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)

-- spilt window
map("n", "sv", ":vsp<CR>", opt) --水平
map("n", "sh", ":sp<CR>", opt)  --垂直
map("n", "sc", "<C-w>c", opt)   --close now window
map("n", "so", "<C-w>o", opt)   --close other window

-- swap # and *
map("n", "#", "*", opt)
map("n", "*", "#", opt)

-- copy select section to system clipboard
-- vnoremap <leader>y "+y
map("v", "<leader>y", "\"+y", opt)

-- like web browser to create new tab
map("n", "<C-t>", ":tabnew<CR>", opt)
map("i", "<C-t>", ":tabnew<CR>", opt)

-- like web browser to close buffer
map("n", "<C-w>", ":bw<CR>", opt)
map("i", "<C-w>", ":bw<CR>", opt)

-- Map ; to : and save shift
-- map("n", ";", ":", opt)

-- parenthesis/bracket 驚豔到我的功能
map("v", "i1", "<esc>`>a)<esc>`<i(<esc>", opt)
map("v", "i2", "<esc>`>a]<esc>`<i[<esc>", opt)
map("v", "i3", "<esc>`>a}<esc>`<i{<esc>", opt)
map("v", "i4", "<esc>`>a\"<esc>`<i\"<esc>", opt)
map("v", "i5", "<esc>`>a'<esc>`<i'<esc>", opt)
map("v", "i6", "<esc>`>a`<esc>`<i`<esc>", opt)
map("v", "i7", "<esc>`>a><esc>`<i<<esc>", opt)

-- plugins keymap

-- nvim-tree
map('n', '<leader>n', ':NvimTreeToggle<CR>', opt)

-- bufferline
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)

-- comment
-- pluginKeys.comment = {
--     toggler = {
--         line = 'gcc',
--         block = 'gbc',
--     },
--     opleader = {
--         line = 'gc',
--         bock = 'gb'
--     }
-- }

-- tagbar
-- map("n", "<leader>o", ":TagbarToggle<CR>", opt)

-- telescope --
map("n", "<leader>fg", ":Telescope live_grep<CR>", opt)
map("n", "<leader>ff", ":Telescope find_files<CR>", opt)
map("n", "<leader>fb", ":Telescope buffers<CR>", opt)

-- toggleterm --
map("n", "<leader>ft", ":ToggleTerm direction=float<CR>", opt)
map("n", "<leader>htop", ":lua _HTOP_TOGGLE()<CR>", opt)
map("n", "<leader>lg", ":lua _LAZYGIT_TOGGLE()<CR>", opt)
map("n", "<leader>hz", ":ToggleTerm direction=horizontal size=10<CR>", opt)

-- undotree
map("n", "<leader>u", ":UndotreeToggle<CR>", opt)

-- nvim-treesitter
map("n", "<leader>ht", ":TSBufToggle highlight<CR>", opt)

-- vista --
map("n", "<leader>o", ":Vista<CR>", opt)

-- trouble --
map("n", "<leader>tr", ":TroubleToggle<CR>", opt)

-- Todo
map("n", "<leader>to", ":TodoTrouble<CR>", opt)

-- Persistence
map("n", "<leader>qs", "<cmd>lua require'persistence'.load()<CR>", opt)
map("n", "<leader>ql", "<cmd>lua require'persistence'.load({last=true})<CR>", opt)
map("n", "<leader>qd", "<cmd>lua require'persistence'.stop()<CR>", opt)

-- -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)

local pluginKeys = {}

--   -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
--   -- leader + =
--   mapbuf('n', '<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>', opt)
--   -- mapbuf('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opt)
--   -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
--   -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
--   -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
--   -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)

-- debug
-- map('n', '<leader>db', '<cmd>lua require'dap'.toggle_breakpoint()<CR>')

-- dap
vim.keymap.set({"i", "n", "v"}, "<F5>", "<cmd>lua require'dap'.continue()<CR>", opt)
vim.keymap.set({"i", "n", "v"}, "<F10>", "<cmd>lua require'dap'.step_over()<CR>", opt)
vim.keymap.set({"i", "n", "v"}, "<F11>", "<cmd>lua require'dap'.step_into()<CR>", opt)
vim.keymap.set({"i", "n", "v"}, "<F12>", "<cmd>lua require'dap'.step_over()<CR>", opt)
vim.keymap.set({"i", "n", "v"}, "<F9>", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opt)
map("n", "<leader>debug", "<cmd>lua require'dapui'.toggle()<CR>", opt)

-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
  return {
    -- 上一个
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    -- 下一个
    ['<Tab>'] = cmp.mapping.select_next_item(),
    -- 出现补全
    ['<A-.>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    -- 取消
    ['<A-,>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- 确认
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ['<CR>'] = cmp.mapping.confirm({
      select = true ,
      behavior = cmp.ConfirmBehavior.Replace
    }),
    -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
  }
end


return pluginKeys
