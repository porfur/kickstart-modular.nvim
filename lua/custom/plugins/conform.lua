-- https://github.com/stevearc/conform.nvim/blob/master/doc/recipes.md#format-command
local key_set = vim.keymap.set
vim.g.format_on_save_enabled = false

-- Toggle Format on save
local toggleFormatOnSave = function()
  vim.g.format_on_save_enabled = not vim.g.format_on_save_enabled
  vim.notify('Format on Save: ' .. (vim.g.format_on_save_enabled and 'Enabled' or 'Disabled'))
end

key_set('n', '<leader><Tab>f', toggleFormatOnSave, { desc = 'Toggle [f]ormat on save' })

-- Format selection
vim.api.nvim_create_user_command('Format', function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ['end'] = { args.line2, end_line:len() },
    }
  end
  require('conform').format { async = true, lsp_format = 'fallback', range = range }
end, { range = true })

key_set('v', '<leader>cf', ':Format<CR>', { desc = '[f]ormat selection' })

return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>cf',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = 'n',
        desc = '[f]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        if not vim.g.format_on_save_enabled then
          return nil
        end
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return nil
        else
          return {
            timeout_ms = 500,
            lsp_format = 'fallback',
          }
        end
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use 'stop_after_first' to run the first available formatter from the list
        javascript = { 'prettier', 'prettierd', stop_after_first = true },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
