return {
  "CopilotC-Nvim/CopilotChat.nvim",
  event = "VeryLazy",
  dependencies = {
    "zbirenbaum/copilot.lua", -- or "github/copilot.vim"
    "nvim-lua/plenary.nvim",
    {
      "Davidyz/VectorCode",
      lazy = true,
    },
  },
  opts = function()
    local vectorcode_ctx = require("vectorcode.integrations.copilotchat").make_context_provider({
      prompt_header = "Here are relevant files from the repository:",
      prompt_footer = "\nConsider this context when answering:",
      skip_empty = true,
    })

    return {
      code_block = {
        enabled = true,
        syntax_highlight = true,
      },
      show_help = true,
      highlight_selection = true,
      auto_follow_cursor = true,
      selection = function(source)
        local select = require("CopilotChat.select")
        if select.visual(source) then
          return select.visual(source)
        else
          return select.buffer(source)
        end
      end,
      contexts = {
        vectorcode = vectorcode_ctx,
      },
      prompts = {
        Explain = {
          prompt = "Explain the following code in detail:\n$input",
          context = { "selection", "vectorcode" },
        },
        GenericCoding = {
          prompt = "You are a coding expert and use best practises for writing well structured, secure and efficient code relying on best coding principles. Help me implement the following feature or change in this codebase:\n$input",
          context = { "selection", "vectorcode" },
        },
        -- Other prompts...
      },
      -- sticky = {
      --   "Using the model $claude-3.7-sonnet-thought",
      --   "#vectorcode", -- Automatically includes repository context in every conversation
      -- },
    }
  end,
}
