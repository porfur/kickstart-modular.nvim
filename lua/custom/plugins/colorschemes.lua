return { -- COLORSCHEMES --
    'cpea2506/one_monokai.nvim',
  dependencies = {
    'romgrk/doom-one.vim',
    'cpea2506/one_monokai.nvim',
    'bluz71/vim-moonfly-colors',
    'navarasu/onedark.nvim',
    'catppuccin/nvim',
    'Mofiqul/dracula.nvim',
    'romgrk/doom-one.vim',
    'bluz71/vim-moonfly-colors',
    {
      'uloco/bluloco.nvim',
      lazy = false,
      priority = 1000,
      dependencies = { 'rktjmp/lush.nvim' },
      config = function()
        -- your optional config goes here, see below.
      end,
    },
  },
  config = function()
    vim.cmd 'colorscheme bluloco'
  end,
}
