return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "nvim-lua/plenary.nvim", branch = "master" },
        },
        build = "make tiktoken",
        opts = {
            -- See Configuration section for options
            window = {
                layout = "vertical",
                width = 0.5,
                title = " AI Assistant",
            },
            auto_insert_mode = true,
        },
    },
}
