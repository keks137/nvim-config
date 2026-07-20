vim.pack.add({
	"https://github.com/brenton-leighton/multiple-cursors.nvim",
})

require("multiple-cursors").setup({})

local map = vim.keymap.set

map({ "n", "x" }, "<C-j>", "<Cmd>MultipleCursorsAddDown<CR>", { desc = "Add cursor and move down" })
map({ "n", "x" }, "<C-k>", "<Cmd>MultipleCursorsAddUp<CR>", { desc = "Add cursor and move up" })

map({ "n", "i", "x" }, "<C-Up>", "<Cmd>MultipleCursorsAddUp<CR>", { desc = "Add cursor and move up" })
map({ "n", "i", "x" }, "<C-Down>", "<Cmd>MultipleCursorsAddDown<CR>", { desc = "Add cursor and move down" })

map({ "n", "i" }, "<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", { desc = "Add or remove cursor" })

map("x", "<Leader>m", "<Cmd>MultipleCursorsAddVisualArea<CR>", { desc = "Add cursors to the lines of the visual area" })

map({ "n", "x" }, "<Leader>a", "<Cmd>MultipleCursorsAddMatches<CR>", { desc = "Add cursors to cword" })
map(
	{ "n", "x" },
	"<Leader>A",
	"<Cmd>MultipleCursorsAddMatchesV<CR>",
	{ desc = "Add cursors to cword in previous area" }
)

map({ "n", "x" }, "<C-n>", "<Cmd>MultipleCursorsAddJumpNextMatch<CR>", { desc = "Add cursor and jump to next cword" })
map({ "n", "x" }, "<C-d>", "<Cmd>MultipleCursorsAddJumpNextMatch<CR>", { desc = "Add cursor and jump to next cword" })
-- map({ "n", "x" }, "<C-d>", "<Cmd>MultipleCursorsJumpNextMatch<CR>", { desc = "Jump to next cword" })

map({ "n", "x" }, "<Leader>l", "<Cmd>MultipleCursorsLock<CR>", { desc = "Lock virtual cursors" })
