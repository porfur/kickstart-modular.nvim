return   {   -- (( GIT )) --
    -- TODO Learn to use these or remove them
    { -- GIT COMMANDS --
      -- https://github.com/tpope/vim-fugitive
      'tpope/vim-fugitive',
    config =function ()
        vim.keymap.set('n', '<leader>gx', '<cmd>GBrowse<CR>', {desc= 'Git Browse'})
    end
    },
    { -- GITHUB INTEGRATION
      -- https://github.com/tpope/vim-rhubarb
      'tpope/vim-rhubarb',
    },
    { -- LAZYGIT
      -- https://github.com/kdheepak/lazygit.nvim
      'kdheepak/lazygit.nvim',
      dependencies = {
        -- optional for floating window border decoration
        -- TODO Try without plenary
        'nvim-lua/plenary.nvim',
      },
      config = function()
        vim.keymap.set('n', '<leader>gg', '<cmd>LazyGit<CR>', {desc= 'Lazy [G]it'})
      end,
    },
  }

