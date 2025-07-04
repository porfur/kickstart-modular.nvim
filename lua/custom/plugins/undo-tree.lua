return   {
    -- UNDO TREE
    -- https://github.com/jiaoshijie/undotree
    'jiaoshijie/undotree',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      require('undotree').setup { float_diff = false }
    end,
    keys = { -- load the plugin only when using it's keybinding:
      { '<leader>u', "<cmd>lua require('undotree').toggle()<cr>" ,desc='[u]ndo tree'},
    },
  }

