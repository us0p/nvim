return {
    "nvim-treesitter/nvim-treesitter",
    -- Branch is recommended as default will switch to "main" in the future
    -- and "master" is locked for backward compatibility
    branch = "master",
    lazy = false, -- nvim-treesitter doesn't support lazy loading
    build = ":TSUpdate", -- Automates parser updates when the plugin is updated
    config = function()
        require("nvim-treesitter.configs").setup({
            -- List of parsers to ensure are installed
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
            -- Install parsers on buffer open if the language is not installed.
            -- Note: this might not auto-install "injection-only" parsers
            auto_install = true,
            highlight = {
                enable = true, -- Enable syntax highlighting
                -- disable = { "c", "rust" }, -- Disable highlight for specific languages if needed
            },
            indent = { enable = true }, -- Enable treesitter-based indentation
            -- Additional treesitter modules can be configured here
            -- For example:
            -- textobjects = { enable = true },
        })
    end,
}
