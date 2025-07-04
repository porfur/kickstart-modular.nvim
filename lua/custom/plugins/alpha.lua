return   { -- WELCOME SCREEN --
    -- Adds a start up screen instead of empty buffer
    -- https://github.com/goolord/alpha-nvim
    'goolord/alpha-nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('alpha').setup(require('alpha.themes.startify').config)
    end,
  }

