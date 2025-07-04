-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- LSP Rename in command window with cursor at the start
vim.api.nvim_create_user_command('LspRenameInCommandWindow', function()
  vim.api.nvim_create_autocmd('CmdlineEnter', {
    callback = function()
      local key = vim.api.nvim_replace_termcodes('<C-f>', true, false, true)
      vim.api.nvim_feedkeys(key, 'c', false)
      vim.api.nvim_feedkeys('0', 'n', false)
    end,
    once = true, -- important to avoid stacking
  })
  vim.lsp.buf.rename()
end, { desc = 'LSP Rename in command window with cursor at the start' })

-- Keymap to quit command window with ESC or CTRL-q
vim.api.nvim_create_autocmd({ 'CmdwinEnter' }, {
  callback = function()
    vim.keymap.set('n', '<esc>', ':quit<CR>', { buffer = true })
    vim.keymap.set({ 'n', 'i' }, '<C-q>', ':quit<CR>', { buffer = true })
  end,
})

vim.api.nvim_create_autocmd('VimLeavePre', {
  callback = function()
    pcall(function()
      vim.cmd 'Neotree close'
    end)
    -- Save session to a specific file, e.g., "Session.vim" in current dir
    vim.cmd 'mksession! Session.vim'
  end,
})
