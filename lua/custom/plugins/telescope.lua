-- NOTE: Plugins can specify dependencies.
--
-- The dependencies are proper plugin specifications as well - anything
-- you do for a plugin at the top level, you can do for a dependency.
--
-- Use the `dependencies` key to specify the dependencies of a particular plugin
return { -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      'nvim-telescope/telescope-fzf-native.nvim',

      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = 'make',

      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },

    -- Useful for getting pretty icons, but requires a Nerd Font.
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },

  config = function()
    -- Telescope is a fuzzy finder that comes with a lot of different things that
    -- it can fuzzy find! It's more than just a "file finder", it can search
    -- many different aspects of Neovim, your workspace, LSP, and more!
    --
    -- The easiest way to use Telescope, is to start by doing something like:
    --  :Telescope help_tags
    --
    -- After running this command, a window will open up and you're able to
    -- type in the prompt window. You'll see a list of `help_tags` options and
    -- a corresponding preview of the help.
    --
    -- Two important keymaps to use while in Telescope are:
    --  - Insert mode: <c-/>
    --  - Normal mode: ?
    --
    -- This opens a window that shows you all of the keymaps for the current
    -- Telescope picker. This is really useful to discover what Telescope can
    -- do as well as how to actually do it!

    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`
    local actions = require 'telescope.actions'
    require('telescope').setup {
      -- You can put your default mappings / updates / etc. in here
      --  All the info you're looking for is in `:help telescope.setup()`
      --
      defaults = require('telescope.themes').get_ivy {

        winblend = 10,
        layout_config = {
          width = function(_, cols, _)
            return cols
          end,
          height = function(_, _, rows)
            return math.ceil(rows * 0.75)
          end,
        },
        previewer = true,

        mappings = {
          -- TODO See defaults and maybe remove these
          i = {
            ['<C-n>'] = actions.cycle_history_next,
            ['<C-p>'] = actions.cycle_history_prev,
            ['<C-j>'] = actions.move_selection_next,
            ['<C-k>'] = actions.move_selection_previous,
            ['<C-x>'] = actions.delete_buffer,
            ['<C-space>'] = 'to_fuzzy_refine',
            ['<C-h>'] = actions.preview_scrolling_left,
            ['<C-l>'] = actions.preview_scrolling_right,
            ['<C-d>'] = actions.preview_scrolling_down,
            ['<C-u>'] = actions.preview_scrolling_up,
          },
          n = {
            ['<C-n>'] = actions.cycle_history_next,
            ['<C-p>'] = actions.cycle_history_prev,
            ['<C-j>'] = actions.move_selection_next,
            ['<C-k>'] = actions.move_selection_previous,
            ['<C-x>'] = actions.delete_buffer,
            ['<C-space>'] = 'to_fuzzy_refine',
            ['<C-h>'] = actions.preview_scrolling_left,
            ['<C-l>'] = actions.preview_scrolling_right,
            ['<C-d>'] = actions.preview_scrolling_down,
            ['<C-u>'] = actions.preview_scrolling_up,
          },
        },
      },
      pickers = {
        marks = {
          attach_mappings = function(prompt_bufnr, map)
            map({ 'n', 'i' }, '<C-x>', function()
              require('telescope.actions').delete_mark(prompt_bufnr)
            end, { desc = 'Delete mark' })
            return true -- Keep default mappings as well as the custom ones
          end,
        },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_cursor(),
        },
      },
    }

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'

    local function find_config_files()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end

    local function live_grep_uu()
      builtin.live_grep { additional_args = { '-uu' } }
    end

    local function find_hidden_files()
      builtin.find_files { hidden = true, no_ignore_p = true }
    end

    local function grep_open_files()
      builtin.live_grep { grep_open_files = true, prompt_title = 'Live Grep in Open Files' }
    end

    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[s]earch [h]elp' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[s]earch [k]eymaps' })
    vim.keymap.set('n', '<leader>sc', builtin.colorscheme, { desc = '[s]earch [c]olorschemes' })
    vim.keymap.set('n', '<leader>st', builtin.builtin, { desc = '[s]earch [t]elescope builtin' })
    vim.keymap.set('n', '<leader>sn', find_config_files, { desc = '[s]earch [n]eovim files' })
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[s]earch [f]iles' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[s]earch current [w]ord' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[s]earch [s]tring (grep)' })
    vim.keymap.set('n', '<leader>ss', builtin.live_grep, { desc = '[s]earch string ([g]rep)' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[s]earch [d]iagnostics' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>.', builtin.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>s?', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = '[/] Fuzzily search in current buffer]' })
    vim.keymap.set('n', '<leader>sF', find_hidden_files, { desc = '[s]earch all [F]iles (including hidden)' })
    vim.keymap.set('n', '<leader>sS', live_grep_uu, { desc = '[s]earch [S]tring (grep all)' })
    vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = '[/] Fuzzily search in current buffer' })

    vim.keymap.set('n', '<leader>s/', grep_open_files, { desc = '[s]earch [/] string in open files' })

    -- Shortcut for searching your Neovim configuration files
  end,
}
