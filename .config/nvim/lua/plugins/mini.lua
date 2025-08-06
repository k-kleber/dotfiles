return {
  {
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
      require("mini.surround").setup()
      require("mini.ai").setup()
      require("mini.comment").setup()
      require("mini.sessions").setup({
        autoread = true, -- auto-read session on startup if in same dir
        autowrite = true, -- auto-write session on exit
        directory = vim.fn.stdpath("data") .. "/sessions", -- session save location
      })
      require("mini.bracketed").setup()
      require("mini.diff").setup()
      require("mini.move").setup()
      require("mini.jump").setup()
      require("mini.pairs").setup()
      require("mini.statusline").setup()
      require("mini.trailspace").setup()
      -- require("mini.completion").setup({
      --   lsp_completion = {
      --     source_func = "omnifunc",
      --     auto_setup = true,
      --     process_items = function(items, base)
      --       -- Use all LSP items by default
      --       return items
      --     end,
      --   },
      -- })
    end,
  },
}
