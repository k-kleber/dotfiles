return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      file_ignore_patterns = {
        "logs/",
        "^logs/",
        "/logs/",
        "^build/",
        "^devel/",
        "/build/",
        "/devel/",
        "%.git/",
        "%.cache/",
        "build/",
        "devel/",
      },
    },
  },
}

