-- autopairs
-- https://github.com/windwp/nvim-autopairs
return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  opts = {
    map_c_h = true, -- Map the <C-h> key to delete a pair
    map_c_w = true, -- map <c-w> to delete a pair if possible
  },
}
