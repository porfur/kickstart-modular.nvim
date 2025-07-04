return {
    'stevearc/oil.nvim',
    opts = {},
  config = function ()
    require('oil').setup({})
    vim.keymap.set('n','<leader>o',':Oil<CR>',{desc='[o]il'})
  end
  }
