return {
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = function()
			local builtin = require("telescope.builtin")
			return {
				{ "<leader>pf", builtin.find_files },
				{
					"<leader>ps",
					function()
						builtin.grep_string({ search = vim.fn.input("Grep > ") })
					end,
				},
			}
		end,
	},
}
