-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>gg", function()
  local snacks = require("snacks")
  local Path = require("plenary.path")

  local function find_git_root(path)
    local dir = Path:new(path):parent()
    while true do
      if dir:joinpath(".git"):exists() then
        return dir:absolute()
      end
      local parent = dir:parent()
      if parent:absolute() == dir:absolute() then
        return nil
      end
      dir = parent
    end
  end

  local buf_path = vim.api.nvim_buf_get_name(0)
  local git_root = buf_path ~= "" and find_git_root(buf_path) or nil

  if not git_root then
    -- Try workspace root as fallback
    local root_dir = vim.fn.getcwd()
    git_root = find_git_root(root_dir)
    if not git_root then
      vim.notify("No Git repository found for current buffer or workspace", vim.log.levels.ERROR)
      return
    end
  end

  snacks.terminal("lazygit", { cwd = git_root, esc_esc = false })
end, { desc = "LazyGit (buffer’s Git root)" })

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<leader>on", "<cmd>ObsidianNew<CR>", vim.tbl_extend("force", opts, { desc = "New note" }))
map("n", "<leader>ot", "<cmd>ObsidianToday<CR>", vim.tbl_extend("force", opts, { desc = "Today’s note" }))
map("n", "<leader>oy", "<cmd>ObsidianYesterday<CR>", vim.tbl_extend("force", opts, { desc = "Yesterday’s note" }))
map("n", "<leader>os", "<cmd>ObsidianSearch<CR>", vim.tbl_extend("force", opts, { desc = "Search notes" }))
map("n", "<leader>oo", "<cmd>ObsidianOpen<CR>", vim.tbl_extend("force", opts, { desc = "Open in Obsidian app" }))
map("n", "<leader>ob", "<cmd>ObsidianBacklinks<CR>", vim.tbl_extend("force", opts, { desc = "Backlinks" }))
map("n", "<leader>ol", "<cmd>ObsidianLinks<CR>", vim.tbl_extend("force", opts, { desc = "Note links" }))
