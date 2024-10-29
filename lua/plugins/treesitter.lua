return{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function()
        ensure_installed = {
             "bash", "dart", "dockerfile", "javascript", "kotlin", "json", "lua", "prisma", "typescript", "python"
        }
        sync_install = false
        auto_install = true
        highlight = {
            enable = true,
        }
        intend = {
            enable = false
        }
    end

}
