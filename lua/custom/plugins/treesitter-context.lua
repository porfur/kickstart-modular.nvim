return {
  -- Treesitter Context --
  -- Show function context at top of the screen when function is long
  -- https://github.com/nvim-treesitter/nvim-treesitter-context
  'nvim-treesitter/nvim-treesitter-context',
  opts = {},
  config = function()
    -- Adds underline to context regardless of the colorscheme
    vim.keymap.set('n', '<leader>cc',function ()
         vim.cmd 'TSContext toggle'
    vim.cmd 'hi TreesitterContextBottom gui=underline guisp=White'
    vim.cmd 'hi TreesitterContextLineNumberBottom gui=underline guisp=Grey'
 
    end, { desc = 'TS [c]ontext toggle' })
  end,
}
