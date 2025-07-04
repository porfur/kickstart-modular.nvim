return { -- STATUS LINE --
    -- https://github.com/nvim-lualine/lualine.nvim
    -- TODO Try removing the options
    'nvim-lualine/lualine.nvim',
    config = function()
vim.opt.showmode = false -- Lualine takes care of this
      local hide = function(section, width)
        width = width or 150
        local condition = function()
          return vim.fn.winwidth(0) > width
        end
        return { section, cond = condition }
      end
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = { 'alpha', 'dashboard', 'packer', 'NVimTree' },
          disabled_buftypes = { 'quickfix', 'prompt' },
          ignore_focus = {},
          always_divide_middle = false,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { { 'filename', path = 1 } },
          lualine_c = { 'diff', 'diagnostics', },
          lualine_x = { hide('branch', 100), hide 'encoding', hide 'fileformat', hide 'filetype' },
          lualine_y = { hide 'progress' },
          lualine_z = { hide 'location' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { { 'filename', path = 1 } },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = { 'nvim-tree', 'neo-tree' },
      }
    end,
  }
