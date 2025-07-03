vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_user_command("LspRenameInCommandWindow", function()
  vim.api.nvim_create_autocmd("CmdlineEnter", {
    callback = function()
      local key = vim.api.nvim_replace_termcodes("<C-f>", true, false, true)
      vim.api.nvim_feedkeys(key, "c", false)
      vim.api.nvim_feedkeys("0", "n", false)
    end,
    once = true, -- important to avoid stacking
  })
  vim.lsp.buf.rename()
end, { desc = "Smart LSP Rename with cursor position tweak" })

vim.api.nvim_create_autocmd({ "CmdwinEnter" }, {
  callback = function()
    vim.keymap.set("n", "<esc>", ":quit<CR>", { buffer = true })
  end,
  desc = "Map <Esc> to :quit in command-line window for quick exit",
})
