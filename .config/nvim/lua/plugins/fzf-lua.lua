local function get_ignore_file()
  local cwd = vim.fn.getcwd()
  local ignore_path = cwd .. "/.vim-ignore" -- or ".ignore", or ".fzfignore"
  if vim.fn.filereadable(ignore_path) == 1 then
    return ignore_path
  else
    -- fallback to a global ignore file or nil
    return vim.fn.expand("$HOME/.config/nvim/vim-ignore")
  end
end

return {
  "ibhagwan/fzf-lua",
  opts = {
    files = {
      fd_opts = "--color=never --type f --hidden --follow --exclude .git --ignore-file " .. get_ignore_file(),
    },
    grep = {
      rg_opts = "--column --line-number --no-heading --color=never --smart-case --hidden --ignore-file "
        .. get_ignore_file(),
    },
  },
}
