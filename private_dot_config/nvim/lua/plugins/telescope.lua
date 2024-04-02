return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
            ["<C-j>"] = require("telescope.actions").move_selection_next,
          },
        },
      },
    },
    keys = {
      { "<leader>/", LazyVim.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
      { "<leader><space>", LazyVim.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
    },
  },
}
