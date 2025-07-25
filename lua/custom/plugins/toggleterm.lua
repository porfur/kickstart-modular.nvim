return { -- TOGGLE TERM --
    -- TODO See what options can be removed
    -- https://github.com/akinsho/toggleterm.nvim
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {

      size = 20,
      open_mapping = [[<C-g>]],
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = 'float',
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = { border = 'curved' },
    },
  }
