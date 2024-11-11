return {
  "neovim/nvim-lspconfig",
  lazy = true,
  ft = { "sh", "c", "cpp", "json", "yaml", "asm", "python", "rust", "lua" },
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    local format = require("lazyvim.util").format
    keys[#keys + 1] = { "K", false }
    keys[#keys + 1] = { "gK", false }
    keys[#keys + 1] = { "<leader>cf", false }
    keys[#keys + 1] = { "<leader>cr", false }
    keys[#keys + 1] = { "gh", vim.lsp.buf.hover, desc = "Hover" }
    keys[#keys + 1] = { "gH", vim.lsp.buf.signature_help, desc = "Signature Help", has = "signatureHelp" }
    keys[#keys + 1] = {
      "<leader>=",
      function()
        format.format({ force = true })
      end,
      desc = "Format Document",
      has = "documentFormatting",
    }
    keys[#keys + 1] = {
      "<leader>=",
      function()
        format.format({ force = true })
      end,
      desc = "Format Range",
      mode = "v",
      has = "documentRangeFormatting",
    }
    if require("lazyvim.util").has("inc-rename.nvim") then
      keys[#keys + 1] = {
        "<leader>rn",
        function()
          require("inc_rename")
          return ":IncRename " .. vim.fn.expand("<cword>")
        end,
        expr = true,
        desc = "Rename",
        has = "rename",
      }
    else
      keys[#keys + 1] = { "<leader>rn", vim.lsp.buf.rename, desc = "Rename", has = "rename" }
    end
  end,
  opts = {
    server = {
      bashls = {},
      clangd = function(_, opts)
        opts.capabilities.offsetEncoding = { "utf-16" }
      end,
      yamlls = {},
      asm_lsp = {},
      lua_ls = {
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = false,
            },
            completion = {},
          },
        },
      },
    },
  },
}
