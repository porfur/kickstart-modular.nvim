--Print hello worlf here
return {
  {
    "olimorris/codecompanion.nvim",
    opts = {},
    dependencies = {
      "ravitemer/mcphub.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    init = function()
      require("codecompanion").setup({
        extensions = {
          mcphub = {
            callback = "mcphub.extensions.codecompanion",
            opts = {
              make_vars = true,
              make_slash_commands = true,
              show_result_in_chat = true,
            },
          },
        },
        strategies = {
          chat = {
            adapter = "OP",
            keymaps = {
              send = {
                modes = { n = "<CR>", i = "<C-s>" },
                opts = {},
              },
              close = {
                modes = { n = "<C-q>", i = "<C-q>" },
                opts = {},
              },
              -- Add further custom keymaps here
            },
          },
          inline = {
            adapter = "OP",
          },
        },
        adapters = {
          -- opts = {
          --   show_defaults = false,
          -- },
          OP = function()
            return require("codecompanion.adapters").extend("openai_compatible", {
              env = {
                url = "http://127.0.0.1:1234",
                -- api_key = "OPENROUTER_API_KEY",
                -- chat_url = "/v1/chat/completions",
              },
              -- schema = {
              --   model = {
              --     default = "qwen/qwen3-1.7b",
              --   },
              -- },
            })
          end,
        },
      })
      vim.keymap.set("n", "<leader>\\", ":CodeCompanionChat Toggle<CR>", { desc = "Toggle CodeCompanionChat" })
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "codecompanion" },
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    opts = {
      preview = {
        filetypes = { "markdown", "codecompanion" },
        ignore_buftypes = {},
      },
    },
  },
  {
    "echasnovski/mini.diff",
    config = function()
      local diff = require("mini.diff")
      diff.setup({
        -- Disabled by default
        source = diff.gen_source.none(),
      })
    end,
  },
}
