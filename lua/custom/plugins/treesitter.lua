  return { -- Treesitter --
    -- https://github.com/nvim-treesitter/nvim-treesitter
    -- TODO Learn what setting are usefull below and remove what is not needed
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      local configs = require 'nvim-treesitter.configs'
      configs.setup {
        TSConfig = {},
        modules = {},
        auto_install = true,
        ensure_installed = { 'c', 'vim', 'lua', 'markdown', 'markdown_inline', 'bash', 'python', 'javascript', 'typescript', 'html', 'css', 'scss' },
        ignore_install = { '' },
        sync_install = false,
        highlight = {
          enable = true,
          -- disable = { "css" }, -- list of language that will be disabled
        },
        autopairs = {
          enable = true,
        },
        indent = { enable = true, disable = { 'python' } },

        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<C-space>',
            node_incremental = '<C-space>',
            -- scope_incremental = '<C-s>',
            node_decremental = '<backspace>',
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim

            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ['aa'] = '@parameter.outer',
              ['ia'] = '@parameter.inner',
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              [']m'] = '@function.outer',
              [']]'] = '@class.outer',
            },
            goto_next_end = {
              [']M'] = '@function.outer',
              [']['] = '@class.outer',
            },
            goto_previous_start = {
              ['[m'] = '@function.outer',
              ['[['] = '@class.outer',
            },
            goto_previous_end = {
              ['[M'] = '@function.outer',
              ['[]'] = '@class.outer',
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ['<leader>a'] = '@parameter.inner',
            },
            swap_previous = {
              ['<leader>A'] = '@parameter.inner',
            },
          },
        },
      }
    end,
  }
