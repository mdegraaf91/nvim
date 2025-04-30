local scratch_dir = vim.fn.stdpath('data') .. '/scratchpads'
vim.fn.mkdir(scratch_dir, "p")

local function run_scratchpad()
  local bufname = vim.api.nvim_buf_get_name(0)

  -- Save the file first
  vim.cmd('w')

  -- Create or reuse an output window
  local output_buf = vim.api.nvim_create_buf(false, true)
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.3)
  local row = math.floor(vim.o.lines * 0.7)
  local col = math.floor(vim.o.columns * 0.1)

  local output_win = vim.api.nvim_open_win(output_buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded',
  })

  -- Run Node.js on the current file
  local result = vim.fn.systemlist({"node", bufname})

  -- Write result into the output buffer
  if result then
    vim.api.nvim_buf_set_lines(output_buf, 0, -1, false, result)
  else
    vim.api.nvim_buf_set_lines(output_buf, 0, -1, false, {"[Error running Node.js]"})
  end

  -- Auto-close the output window after 5 seconds if no errors
  if not result[1]:match("Error") then
    vim.defer_fn(function()
      if vim.api.nvim_win_is_valid(output_win) then
        vim.api.nvim_win_close(output_win, true)
      end
    end, 5000)
  end
end

local function close_scratchpad()
  local bufname = vim.api.nvim_buf_get_name(0)
  if bufname:find(scratch_dir) then
    vim.cmd('bd!')
  else
    print("Not a scratchpad file.")
  end
end

local function list_scratchpads()
  local ok, telescope = pcall(require, 'telescope.builtin')
  if not ok then
    print("Telescope is not installed!")
    return
  end

  telescope.find_files({
    prompt_title = 'Scratchpads',
    cwd = scratch_dir,
    hidden = true,
  })
end

-- Setup an autocommand group
vim.api.nvim_create_augroup('JavaScriptScratchpad', { clear = true })

vim.api.nvim_create_autocmd('BufWritePost', {
  group = 'JavaScriptScratchpad',
  pattern = scratch_dir .. '/*.scratch.js',
  callback = run_scratchpad,
})

-- Keymap to open a scratchpad file
vim.keymap.set('n', '<leader>js', function()
  vim.cmd('enew')
  vim.bo.filetype = 'javascript'
  vim.cmd('file ' .. scratch_dir .. '/scratch_' .. os.date('%Y%m%d_%H%M%S') .. '.scratch.js')
end, { desc = 'Open JavaScript Scratchpad' })

-- Keymap to close a scratchpad file
vim.keymap.set('n', '<leader>jc', close_scratchpad, { desc = 'Close JavaScript Scratchpad' })

-- Keymap to list and open scratchpad files
vim.keymap.set('n', '<leader>jl', list_scratchpads, { desc = 'List JavaScript Scratchpads' })
