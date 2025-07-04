return { -- (( HARPOON )) --
  -- Cool bookmark  file navigation
  'ThePrimeagen/harpoon',
  config = function()
    local mark = require 'harpoon.mark'
    local ui = require 'harpoon.ui'
    local nav = function(file_nr)
      return function()
        ui.nav_file(file_nr)
      end
    end
    vim.keymap.set('n', '<leader>m', mark.add_file, {desc= 'Harpoon [m]ark'})
    vim.keymap.set('n', '<leader>M', ui.toggle_quick_menu, {desc= 'Harpoon [M]enu'})
    vim.keymap.set('n', '<leader>n', ui.nav_next, {desc= 'Harpoon [n]ext'})
    vim.keymap.set('n', '<leader>p', ui.nav_prev, {desc= 'Harpoon [p]revious'})
    vim.keymap.set('n', '<leader>h', nav(1), {desc= 'Harpoon to file 1'})
    vim.keymap.set('n', '<leader>j', nav(2), {desc= 'Harpoon to file 2'})
    vim.keymap.set('n', '<leader>k', nav(3), {desc= 'Harpoon to file 3'})
    vim.keymap.set('n', '<leader>l', nav(4), {desc= 'Harpoon to file 4'})
    vim.keymap.set('n', '<leader>;', nav(5), {desc= 'Harpoon to file 5'})
    vim.keymap.set('n', "<leader>'", nav(6), {desc= 'Harpoon to file 6'})
  end,
}
