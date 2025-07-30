return {
  "CopilotC-Nvim/CopilotChat.nvim",
  event = "VeryLazy",
  dependencies = {
    "zbirenbaum/copilot.lua", -- or "github/copilot.vim"
    "nvim-lua/plenary.nvim",
  },
  opts = {
    -- sticky = function()
    --   local ft = vim.bo.filetype
    --   if ft == "markdown" then
    --     return { "You are editing a Markdown document. Focus on clarity and formatting." }
    --   elseif ft == "cpp" or ft == "c" or ft == "python" then
    --     return {
    --       "You are a programming expert. You are editing code. Provide concise, idiomatic, and well-documented solutions. Use language specific best practices.",
    --     }
    --   else
    --     return ""
    --   end
    -- end,
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
  },
}
