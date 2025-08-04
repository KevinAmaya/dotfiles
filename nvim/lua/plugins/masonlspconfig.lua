return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        -- This will automatically set up all installed servers with default config
        setup_handlers = {
            function(server_name)
                require("lspconfig")[server_name].setup({})
            end,
        },
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
}
