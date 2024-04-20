return {
  {
    "nvim-neotest/neotest",
    lazy = true,
    dependencies = {
      "zidhuss/neotest-minitest",
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
      },
    },
  },
}
