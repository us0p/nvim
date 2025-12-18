return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSUpdate", "TSUpdateSync" },
    opts_extend = { "ensure_installed" },

    ---@type TSConfig
    opts = {
        auto_install = true, -- auto-install missing parsers
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },

        ensure_installed = {
            "c",
            "lua",
            "vim",
            "vimdoc",
            "javascript",
            "html",
            "python",
            "yaml",
            "bash",
            "jsdoc",
            "json",
            "luadoc",
            "luap",
            "markdown",
            "markdown_inline",
            "printf",
            "typescript",
        },
    },

    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
