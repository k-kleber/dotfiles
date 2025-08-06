return {
  "hrsh7th/nvim-cmp",
  -- Set the event to 'InsertEnter' to only load the plugin when entering insert mode.
  -- This improves startup time.
  event = "InsertEnter",

  -- Dependencies for the various completion sources you'll use.
  dependencies = {
    -- The source for your Language Server Protocol (LSP) completions.
    -- This is what mini.completion leverages.
    "hrsh7th/cmp-nvim-lsp",

    -- The source to pull words from the current buffer.
    "hrsh7th/cmp-buffer",

    -- The source for file path completions.
    "hrsh7th/cmp-path",

    -- The primary snippet engine for Neovim.
    "L3MON4D3/LuaSnip",

    -- Integration between LuaSnip and nvim-cmp.
    "saadparwaiz1/cmp_luasnip",

    -- A wrapper for GitHub Copilot that works with nvim-cmp.
    -- This allows Copilot suggestions to appear in the standard completion menu.
    "zbirenbaum/copilot-cmp",

    -- The actual GitHub Copilot plugin for Neovim.
    "zbirenbaum/copilot.lua",
  },

  -- The main configuration function for nvim-cmp.
  config = function()
    -- Get the `cmp` and `luasnip` modules.
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    -- Set up copilot.lua. It's important to set 'suggestion.enabled = false'
    -- so that it doesn't show inline completions, and instead funnels them
    -- through nvim-cmp.
    require("copilot").setup({
      suggestion = { enabled = false },
      panel = { enabled = false },
      -- Add any other copilot configuration here.
    })

    -- Set up copilot-cmp. This is a minimal setup that just enables the source.
    require("copilot_cmp").setup()

    -- Set up nvim-cmp with source prioritization.
    cmp.setup({
      -- Configure the snippet engine to use LuaSnip.
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      -- Crucial part: Define the order of your completion sources.
      -- The sources are prioritized from top to bottom.
      sources = {
        -- Use mini.completion's LSP output as primary source.
        { name = "nvim_lsp", priority = 100 },
        -- Snippets for common code patterns.
        { name = "luasnip", priority = 25 },
        -- Words from the open buffers.
        { name = "buffer", priority = 10 },
        -- File paths.
        { name = "path", priority = 5 },
        -- Copilot as lowest priority source.
        { name = "copilot", priority = 1 },
      },

      -- Key mappings for a smooth completion experience.
      mapping = cmp.mapping.preset.insert({
        -- `<CR>` will confirm the selection if the popup is open.
        -- Otherwise, it will just insert a newline.
        ["<CR>"] = cmp.mapping.confirm({ select = true }),

        -- Use `<Tab>` and `<S-Tab>` to navigate the completion menu.
        ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),

        -- Trigger completion manually with `<C-Space>`.
        ["<C-Space>"] = cmp.mapping.complete(),

        -- Navigate between snippet placeholders.
        ["<C-e>"] = cmp.mapping.close(),
        ["<C-f>"] = cmp.mapping(function()
          if luasnip.jumpable(1) then
            luasnip.jump(1)
          else
            cmp.mapping.abort()
          end
        end, { "i", "s" }),
        ["<C-b>"] = cmp.mapping(function()
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            cmp.mapping.abort()
          end
        end, { "i", "s" }),
      }),
    })
  end,
}
