return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      python = { "ruff_format" },
      cpp = { "clang_format" },
    },
    -- Register the ruff formatter if not built-in
    formatters = {
      ruff_format = {
        command = "ruff",
        args = { "format", "-" },
        stdin = true,
      },
    },
  },
}