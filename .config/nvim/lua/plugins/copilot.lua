return {
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        auto_trigger = false,
        keymap = {
          -- accept = "<CR>", -- Shift+Enter accepts the whole suggestion
          accept_word = "<M-CR>", -- Alt Enter accepts the next word/part
          accept_line = "<M-l>", -- (optional) Alt+L accepts the next line
          next = "<M-]>", -- (optional) Alt+] for next suggestion
          prev = "<M-[>", -- (optional) Alt+[ for previous suggestion
        },
      },
      panel = { enabled = false },
    })
  end,
}
