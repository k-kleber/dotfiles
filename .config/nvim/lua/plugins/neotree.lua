return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = false, -- Set to true if you want to toggle hidden files
        hide_dotfiles = true,
        hide_gitignored = true,
        hide_by_name = {
          "build",
          "devel",
        },
        never_show = {
          "build",
          "devel",
        },
      },
    },
  },
}

