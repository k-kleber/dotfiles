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
    end,
  },
}
