return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	opts = {
		default_source = "filesystem",
		popup_border_style = "rounded",
		filesystem = {
			filtered_items = {
				hide_dotfiles = false,
				show_hidden_count = true,
				hide_gitignored = true,
			},
			find_args = function(cmd, path, search_term, args)
				table.insert(args, "--exclude")
				table.insert(args, ".git")
				return args
			end,
		},
		window = {
			position = "current",
		},
		default_component_configs = {
			modified = {
				symbol = "[+]",
				highlight = "NeoTreeModified",
			},
			type = {
				enabled = false,
			},
			symlink_target = {
				enabled = true,
				required_width = 122,
			},
		},
	},
}
