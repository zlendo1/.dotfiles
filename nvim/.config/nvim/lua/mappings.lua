require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-f>", "<C-f>zz")
map("n", "<C-b>", "<C-b>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Git
local gitsigns = require "gitsigns"

map("n", "]c", function()
  if vim.wo.diff then
    vim.cmd.normal { "]c", bang = true }
  else
    gitsigns.nav_hunk "next"
  end
end, { desc = "next git hunk" })

map("n", "[c", function()
  if vim.wo.diff then
    vim.cmd.normal { "[c", bang = true }
  else
    gitsigns.nav_hunk "prev"
  end
end, { desc = "previous git hunk" })

map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "git stage hunk" })
map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "git reset hunk" })
map("v", "<leader>gs", function()
  gitsigns.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
end, { desc = "git stage hunk" })
map("v", "<leader>gr", function()
  gitsigns.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
end, { desc = "git stage hunk" })
map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "git stage buffer" })
map("n", "<leader>gu", gitsigns.undo_stage_hunk, { desc = "git undo stage buffer" })
map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "git reset buffer" })
map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "git preview hunk" })
map("n", "<leader>gi", gitsigns.preview_hunk_inline, { desc = "git preview hunk inline" })
map("n", "<leader>gb", gitsigns.toggle_current_line_blame, { desc = "git toggle blame line" })
map("n", "<leader>gB", gitsigns.blame, { desc = "git blame buffer" })
map("n", "<leader>gd", gitsigns.diffthis, { desc = "git diff with index" })
map("n", "<leader>gD", function()
  gitsigns.diffthis "~"
end, { desc = "git diff with last commit" })
map("n", "<leader>gf", function()
  require("telescope").extensions.git_diffs.diff_commits { use_gitsigns = true }
end, { desc = "telescope commit to diff" })
