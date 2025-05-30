return {
    {
        "catppuccin/nvim"
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { 
        "nvim-treesitter/nvim-treesitter", 
        build = ":TSUpdate" 
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        },
        lazy = false, -- neo-tree will lazily load itself
        opts={
            filesystem={
                visible = true,
                hide_dotfiles = false,
            }
        }
    },
    {
        "CRAG666/code_runner.nvim", config = true 
    },
    {
        "williamboman/mason.nvim"
    },
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
}
