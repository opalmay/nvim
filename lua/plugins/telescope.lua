return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	requires = { "nvim-lua/plenary.nvim" },
	config = function()
		require("telescope").setup()

		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>f", function()
			builtin.find_files()
		end)
		vim.keymap.set("n", "<C-t>", function()
			builtin.live_grep()
		end)
		vim.keymap.set("n", "<leader>g", function()
			builtin.git_files()
		end)
		vim.keymap.set("n", "<leader>pw", function()
			local word = vim.fn.expand("<cword>")
			builtin.grep_string({ search = word })
		end)
		vim.keymap.set("n", "<leader>pW", function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end)
		vim.keymap.set("n", "<leader>ps", function()
			builtin.grep_string({ search = vim.fn.input("Search for: ") })
		end)
		vim.keymap.set("n", "<leader>vh", builtin.help_tags)
	end,
}
