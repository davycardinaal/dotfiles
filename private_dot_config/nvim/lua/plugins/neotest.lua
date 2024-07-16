return {
  {
    "nvim-neotest/neotest",
    lazy = true,
    dependencies = {
      "zidhuss/neotest-minitest",
      "marilari88/neotest-vitest",
    },
    opts = {
      adapters = {
        ["neotest-minitest"] = {
          test_cmd = function()
            return vim.tbl_flatten({
              "bin/rails",
              "test",
            })
          end,
        },
        ["neotest-vitest"] = {},
      },
    },
  },
}
