return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "j-hui/fidget.nvim", -- Display status
    {
      "Davidyz/VectorCode", -- Index and search code in your repositories
      version = "*",
      build = "uv tool install vectorcode",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
  },
  opts = {
    ---@module "codecompanion"
    ---@type CodeCompanion.Config
    default_strategy = "chat",
    strategies = {
      chat = {
        adapter = "copilot",
        variables = {
          ["buffer"] = {
            opts = {
              default_params = "watch",
            },
          },
        },
      },
      inline = { adapter = "copilot", enabled = false },
    },
    prompt_library = {
      ["GenericCoding"] = {
        strategy = "chat",
        description = "Implement a feature or change in the codebase using vectorized context",
        opts = {
          index = 1,
          is_slash_cmd = true,
          auto_submit = false,
          short_name = "code_vectorized",
        },
        prompts = {
          {
            {
              role = "user",
              content = "You are a coding expert and use best practises for writing well structured, secure and efficient code relying on best coding principles. Help me implement the following feature or change in this codebase.",
              context = { "selection", "vectorcode" },
              opts = {
                auto_submit = false,
              },
            },
          },
        },
      },
      -- ...other prompts...
    },
    extensions = {
      vectorcode = {
        opts = {
          tool_group = {
            enabled = true,
            extras = {},
            collapse = false,
          },
          tool_opts = {
            ["*"] = {},
            ls = {},
            vectorise = {},
            query = {
              max_num = { chunk = -1, document = -1 },
              default_num = { chunk = 50, document = 10 },
              include_stderr = false,
              use_lsp = false,
              no_duplicate = true,
              chunk_mode = false,
              summarise = {
                enabled = false,
                adapter = nil,
                query_augmented = true,
              },
            },
            files_ls = {},
            files_rm = {},
          },
        },
      },
    },
  },
}
