return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup()

			local map = vim.keymap.set

			map("n", "<M-a>", function()
				harpoon:list():add()
			end, { desc = "harpoon add file" })

			map("n", "<M-f>", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end, { desc = "harpoon quick menu" })

			map("n", "<M-q>", function()
				harpoon:list():select(1)
			end, { desc = "harpoon to file 1" })

			map("n", "<M-w>", function()
				harpoon:list():select(2)
			end, { desc = "harpoon to file 2" })

			map("n", "<M-e>", function()
				harpoon:list():select(3)
			end, { desc = "harpoon to file 3" })

			map("n", "<M-r>", function()
				harpoon:list():select(4)
			end, { desc = "harpoon to file 4" })

			map("n", "<M-t>", function()
				harpoon:list():select(5)
			end, { desc = "harpoon to file 5" })

			map("n", "<PageUp>", function()
				harpoon:list():prev()
			end, { desc = "harpoon to previous file" })

			map("n", "<PageDown>", function()
				harpoon:list():next()
			end, { desc = "harpoon to next file" })
		end,
	},
}
