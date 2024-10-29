return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
     dependencies = { 'nvim-lua/plenary.nvim', 'BurntSushi/ripgrep' , 'nvim-telescope/telescope-live-grep-args.nvim'},
     config = function()
        local telescope = require('telescope')
        telescope.setup{
            extensions = {
                telescope_live_grep_args = {}
            }
        }

        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
        vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
        vim.keymap.set("n", "<leader>ps", builtin.grep_string)
        vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
        --vim.keymap.set("n", "<leader>lg", builtin.live_grep, {})
        --vim.keymap.set("n", "<leader>qf", builtin.quick_fix, {})
        telescope.load_extension("live_grep_args")
    end
}

