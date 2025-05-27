return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    open_on_setup = false,
    open_on_setup_file = false,
    filesystem = {
      filtered_items = {
        visible = true, -- Set to true if you want to toggle hidden files
        hide_dotfiles = true,
        hide_gitignored = true,
        hide_by_name = {
          "build",
          "devel",
          ".cache",
          ".vscode",
        },
        never_show = {
          "build",
          "devel",
          ".cache",
          ".vscode",
        },
      },
    },
  },
}

