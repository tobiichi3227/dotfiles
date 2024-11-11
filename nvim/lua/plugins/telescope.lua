return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },
  keys = {
    { "<leader><space>", false },
    { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Find in Files (Grep)" },
  },
}
