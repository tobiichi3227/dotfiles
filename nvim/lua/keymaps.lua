-- leader key = ,
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- local variables
local pluginKeys = {}
local map = vim.api.nvim_set_keymap
local opt = {
    noremap = true,
    silent = true
}

map("i", "jj", "<ESC>", opt)
map("v", "v", "<ESC>", opt)
map("n", "H", "0", opt)
map("v", "H", "0", opt)
map("n", "L", "$", opt)
map("v", "L", "$", opt)

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

-- plugins keymap

-- nvim-tree
map('n', '<leader>n', ':NvimTreeToggle<CR>', opt)

-- bufferline
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)

-- comment
pluginKeys.comment = {
    toggler = {
        line = 'gcc',
        block = 'gbc',
    },
    opleader = {
        line = 'gc',
        bock = 'gb'
    }
}

-- tagbar
-- map("n", "<leader>o", ":TagbarToggle<CR>", opt)

-- toggleterm --
map("n", "<leader>ft", ":ToggleTerm direction=float<CR>", opt)
map("n", "<leader>htop", ":lua _HTOP_TOGGLE()<CR>", opt)
map("n", "<leader>hz", ":ToggleTerm direction=horizontal size=10<CR>", opt)

-- undotree
map("n", "<leader>u", ":UndotreeToggle<CR>", opt)

-- calendar
map("n", "<leader>time", ":Calendar -view=clock<CR>", opt)
map("n", "<leader>cal", ":Calendar<CR>", opt)

-- nvim-treesitter
map("n", "<leader>ht", ":TSBufToggle highlight<CR>", opt)

-- vista --
map("n", "<leader>o", ":Vista<CR>", opt)

-- trouble --
map("n", "<leader>tr", ":TroubleToggle<CR>", opt)

-- lsp


-- lsp 調用函數shortcut config

map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opt)
  -- code action
map('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opt)
  -- go xx
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
map('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opt)
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opt)
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opt)
-- diagnostic
map('n', 'go', '<cmd>lua vim.diagnostic.open_float()<CR>', opt)
map('n', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opt)
map('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opt)
-- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
-- leader + =
map('n', '<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>', opt)


local pluginKeys = {}

-- lsp 回调函数快捷键设置
pluginKeys.maplsp = function(mapbuf)
  -- rename
  mapbuf('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opt)
  -- code action
  mapbuf('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opt)
  -- go xx
  mapbuf('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
  mapbuf('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opt)
  mapbuf('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opt)
  mapbuf('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
  mapbuf('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opt)
  -- diagnostic
  mapbuf('n', 'go', '<cmd>lua vim.diagnostic.open_float()<CR>', opt)
  mapbuf('n', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opt)
  mapbuf('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opt)
  -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
  -- leader + =
  mapbuf('n', '<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>', opt)
  -- mapbuf('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opt)
  -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
  -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

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
