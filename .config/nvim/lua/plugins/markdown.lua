return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" }, -- if you use standalone mini plugins
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  ft = { "markdown", "codecompanion" },
  opts = {
    render_modes = { "n", "c", "t" },
    sign = {
      enabled = false, -- Turn off in the status column
    },
    overrides = {
      filetype = {
        codecompanion = {
          html = {
            tag = {
              buf = { icon = " ", highlight = "CodeCompanionChatIcon" },
              file = { icon = " ", highlight = "CodeCompanionChatIcon" },
              group = { icon = " ", highlight = "CodeCompanionChatIcon" },
              help = { icon = "󰘥 ", highlight = "CodeCompanionChatIcon" },
              image = { icon = " ", highlight = "CodeCompanionChatIcon" },
              symbols = { icon = " ", highlight = "CodeCompanionChatIcon" },
              tool = { icon = "󰯠 ", highlight = "CodeCompanionChatIcon" },
              url = { icon = "󰌹 ", highlight = "CodeCompanionChatIcon" },
            },
          },
        },
      },
    },
  },
}
