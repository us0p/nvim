return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = function ()
	local harpoon = require("harpoon")

	return {
	    {
		"<C-e>",
		function ()
		    harpoon.ui:toggle_quick_menu(harpoon:list())
		end
	    },
	    {
		"<leader>a",
		function ()
		    harpoon:list():add()
		end
	    },
	    {
		"<C-h>",
		function ()
		    harpoon:list():select(1)
		end
	    },
	    {
		"<C-t>",
		function ()
		    harpoon:list():select(2)
		end
	    },
	    {
		"<C-n",
		function ()
		    harpoon:list():select(3)
		end
	    },
	    {
		"<C-s>",
		function ()
		    harpoon:list():select(4)
		end
	    }
	}
    end
}
