return {
    { "ThePrimeagen/harpoon", 
      branch = "harpoon2",
      dependencies = { "nvim-lua/plenary.nvim" }
    },
    "nvim-lua/plenary.nvim",
    {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function () 
	  local configs = require("nvim-treesitter.configs")

    	  configs.setup({
    	      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "html", "css", "python", "go" },
    	      sync_install = false,
    	      highlight = { enable = true },
    	      indent = { enable = true },  
    	    })
    	end
    },
    {
	'nvim-telescope/telescope.nvim', tag = '0.1.6',
	dependencies = { 'nvim-lua/plenary.nvim' }
    },
    -- lsp packages
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},
    -- lsp packages
}
