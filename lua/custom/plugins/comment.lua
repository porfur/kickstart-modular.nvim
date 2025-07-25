-- https://github.com/numToStr/Comment.nvim
return {
  'numToStr/Comment.nvim',
  dependencies = {
    -- Comment based on treesitter context ( used for JSX )
    -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
    'JoosepAlviste/nvim-ts-context-commentstring',
  },
  config = function()
    require('Comment').setup {
      pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
    }
  end,
}
