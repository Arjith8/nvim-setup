return {
	"voldikss/vim-floaterm",
    config = function ()
        vim.keymap.set({"n", "t"}, "<M-t>", function() vim.cmd("FloatermToggle!") end)
        vim.keymap.set({"n","t"}, "<M-n>", function () vim.cmd("FloatermNew!") end)
        vim.keymap.set({"t"},"<leader>n" , function () vim.cmd("FloatermNext") end)
    end
}
