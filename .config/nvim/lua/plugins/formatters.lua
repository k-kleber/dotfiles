return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      python = { "ruff_format" },
    },
    -- Optional: enable format on save
    format_on_save = function(bufnr)
      -- Disable autoformat for files in a specific directory with:
      -- return not vim.fn.expand("%:p"):match("/node_modules/")
      return true
    end,
  },
  -- Register the ruff formatter if not built-in
  config = function(_, opts)
    local conform = require("conform")
    conform.setup(opts)

    conform.formatters.ruff_format = {
      command = "ruff",
      args = { "format", "-" },
      stdin = true,
    }
  end,
}
