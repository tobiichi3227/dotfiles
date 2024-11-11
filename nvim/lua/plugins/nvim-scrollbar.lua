return {
  "petertriho/nvim-scrollbar",
  lazy = true,
  event = { "BufReadPost", "BufNewFile" },

  opts = function(_, opts)
    local colors = require("tokyonight.colors").setup()
    opts.handle = {
      color = colors.bg_highlight,
    }

    opts.marks = {
      Search = { color = colors.orange },
      Error = { color = colors.error },
      Warn = { color = colors.warning },
      Info = { color = colors.info },
      Hint = { color = colors.hint },
      Misc = { color = colors.purple },
    }

    opts.handlers = {
      cursor = true,
      diagnostic = true,
      gitsigns = true, -- Requires gitsigns
      handle = true,
      search = false, -- Requires hlslens
      ale = false, -- Requires ALE
    }
  end,
}
