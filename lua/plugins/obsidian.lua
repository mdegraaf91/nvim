return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  config = function()
    require("obsidian").setup({
      dir = "~/Vault/Vault",
      notes_subdir = "0 Inbox",
      new_notes_location = "notes_subdir",
      picker = { name = "telescope.nvim" },
      ui = {
        checkboxes = {
          [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
          ["x"] = { char = "", hl_group = "ObsidianDone" },
        }
      },
      note_id_func = function(title)
        return title
      end,
      note_path_fun = function(spec)
        local path = spec.dir / tostring(spec.title)

        return path:with_suffix(".md")
      end
    })

    vim.keymap.set('n', "<leader>n", "<cmd>ObsidianNew<CR>", { desc = "Create New Note" })
    vim.keymap.set('n', "<leader>t", "<cmd>ObsidianToday<cr>", { desc = "Open / Create daily note" })
    vim.keymap.set('n', 'gf', '<cmd>ObsidianFollowLink<CR>', { noremap = true, silent = true })
  end
}
