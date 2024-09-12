return {
    "brett-griffin/phpdocblocks.vim",
    config = function()
        vim.keymap.set("n", "<leader>pd", ":PHPDocBlocks<CR>", {})
    end
}
