return {
  "ibhagwan/fzf-lua",
  opts = {
    files = {
      fd_opts = table.concat({
        "--color=never",
        "--type", "f",
        "--hidden",
        "--follow",
        -- do NOT add --no-ignore!
      }, " "),
    },
    grep = {
      rg_opts = table.concat({
        "--column",
        "--line-number",
        "--no-heading",
        "--color=never",
        "--smart-case",
        "--hidden",
        -- do NOT add --no-ignore!
      }, " "),
    },
  },
}
