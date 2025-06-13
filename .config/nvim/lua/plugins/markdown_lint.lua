return {
  {
    "nvim-lint",
    config = function()
      require("lint").linters.markdownlint.args = { "--disable", "MD013" }
    end,
  },
}
