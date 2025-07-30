return {
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = "<CR>", -- Shift+Enter accepts the whole suggestion
          accept_word = "<M-CR>", -- Enter accepts the next word/part
          accept_line = "<M-l>", -- (optional) Alt+L accepts the next line
          next = "<M-]>", -- (optional) Alt+] for next suggestion
          prev = "<M-[>", -- (optional) Alt+[ for previous suggestion
        },
      },
      panel = { enabled = false },
    })
  end,
}
