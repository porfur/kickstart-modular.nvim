local utils = require 'custom.utils'
local key_set = vim.keymap.set

local toggle_wildignore = utils.toggle_wildignore
local toggle_quickfix = utils.toggle_quickfix
local toggle_locallist = utils.toggle_locallist
local diagnostic_jump = utils.diagnostic_jump
local toggle_zoom = utils.toggle_zoom

-- Disable Single Space
-- key_set('', '<Space>', '<Nop>', {desc= 'Space'})

-- press kj fast to esc
key_set('i', 'kj', '<esc>')

-- Center cursor when moving pages
key_set('n', '<C-d>', '<C-d>zz')
key_set('n', '<C-u>', '<C-u>zz')
key_set('n', '<C-f>', '<C-f>zz')
key_set('n', '<C-b>', '<C-b>zz')

-- Better window navigation
key_set('n', '<C-h>', '<C-w>h', { desc = 'Window Navigate Left' })
key_set('n', '<C-j>', '<C-w>j', { desc = 'Window Navigate Down' })
key_set('n', '<C-k>', '<C-w>k', { desc = 'Window Navigate Up' })
key_set('n', '<C-l>', '<C-w>l', { desc = 'Window Navigate Right' })

-- Resize with Alt-hjkl
key_set('n', '<M-j>', ':resize -2<CR>', { desc = 'Window Horizontal Shrink' })
key_set('n', '<M-k>', ':resize +2<CR>', { desc = 'Window Horizontal Grow' })
key_set('n', '<M-h>', ':vertical resize -2<CR>', { desc = 'Window Vertical Shrink' })
key_set('n', '<M-l>', ':vertical resize +2<CR>', { desc = 'Window Vertical Grow' })
key_set('n', '<M-=>', ':wincmd =<CR>', { desc = 'Equalize Windows' })
key_set('n', '<M-\\>', ':vertical resize 999<CR>', { desc = 'Max out the width' })
key_set('n', '<M-->', ':resize 999<CR>', { desc = 'Max out the height' })
key_set('n', '<M-Z>', toggle_zoom, { desc = 'Max out the height' })
key_set('n', '<C-w>z', toggle_zoom, { desc = 'Max out the height' })

-- Tabs
-- TODO: Put index number on tab
key_set('n', '<leader>tc', ':tabnew<CR>', { desc = 'Tab New' })
key_set('n', '<leader>tx', ':tabclose<CR>', { desc = 'Tab Close' })
key_set('n', '<leader>tn', ':tabnext<CR>', { desc = 'Tab Next' })
key_set('n', '<leader>tp', ':tabprevious<CR>', { desc = 'Tab Previous' })
key_set('n', '<leader>to', ':tabonly<CR>', { desc = 'Tab Only' })
key_set('n', '<leader>tm', ':tabmove', { desc = 'Tab Move' })

-- Navigate buffers
key_set('n', '<C-n>', ':bnext<CR>', { desc = 'Buffer Next' })
key_set('n', '<C-p>', ':bprevious<CR>', { desc = 'Buffer Previous' })
key_set('n', '<leader>bn', ':bnext<CR>', { desc = 'Buffer Next' })
key_set('n', '<leader>bp', ':bprevious<CR>', { desc = 'Buffer Previous' })
key_set('n', '<leader>n', ':bnext<CR>', { desc = 'Buffer Next' })
key_set('n', '<leader>p', ':bprevious', { desc = 'Buffer Previous' })
key_set('n', '<leader>ba', '<C-^>', { desc = 'Alternate Buffer' })
key_set('n', '<leader>a', '<C-^>', { desc = 'Alternate Buffer' })
key_set('n', '<Tab>', '<C-^>', { desc = 'Alternate Buffer' })

--Save buffers
key_set({ 'n', 'v' }, '<leader>bs', ':write<CR>', { desc = 'Write Buffer' })
key_set({ 'n', 'v' }, 'ZS', ':write<CR>', { desc = 'Write Buffer' })
key_set({ 'n', 'v' }, '<leader>bS', ':wall<CR>', { desc = 'Write all Buffers' })
key_set({ 'n', 'v' }, '<leader>bw', ':write<CR>', { desc = 'Write Buffer' })
key_set({ 'n', 'v' }, '<leader>bW', ':wall<CR>', { desc = 'Write all Buffers' })
key_set({ 'n', 'v' }, '<C-s>', ':write<CR>', { desc = 'Write Buffer' })
key_set({ 'n', 'v' }, '<C-S>', ':wall<CR>', { desc = 'Write all Buffers' })

key_set('n', 'gq', ':!qlmanage -p %<CR>', { desc = 'Quicklook file' })
key_set('n', 'gQ', ':!open .<CR>', { desc = 'Open directory in finder' })
key_set('n', 'yp', ':let @+=expand("%")<CR>', { desc = '[y]ank relative [p]ath to system clipboard' })

-- Close buffers
-- TODO: SIMPLIFY THIS USING THE Z command
-- switch to prev buffer then delete prev buffer [ bdelete# ]
-- That way splits dont close
-- TODO: Organize these And figure out what they do
key_set('n', '<leader>bd', ':bdelete!<CR>', { desc = 'Delete Buffer (Discard Changes)' })
key_set('n', '<leader>bD', ':%bdelete!<CR>', { desc = 'Delete All Buffer (Discard Changes)' })
key_set('n', '<leader>bc', ':write<bar>bdelete#<CR>', { desc = 'Write & Delete Buffer' })
key_set('n', '<leader>bC', ':wall<bar>%bdelete<CR>', { desc = 'Write & Delete Buffers' })

-- Clear highlights
key_set('n', '<leader>x', ':nohlsearch<CR>', { desc = 'Clear Search Highlight' })
key_set('n', '<Esc>', ':nohlsearch<CR>', { desc = 'Clear Search Highlight' })

-- Marks
key_set('n', '<leader>`x', ':delmarks ', { desc = 'Delete mark...' })
key_set('n', '<leader>`d', ':delmarks!<CR>', { desc = 'Delete local marks' })
key_set('n', '<leader>`D', ':delmarks A-Z0-9<CR>', { desc = 'Delete global marks' })
key_set('n', '<leader>`l', ':marks<CR>', { desc = 'List marks' })

-- Paste in visual mode doesn't polute the clipboard with the old selection
key_set('v', 'p', '"_dp')

-- visual stay in indent mode
key_set('v', '<', '<gv')
key_set('v', '>', '>gv')

-- Move line in visual mode
key_set('v', 'J', ":m '>+1<CR>gv=gv")
key_set('v', 'K', ":m '<-2<CR>gv=gv")

--Insert New Line in normal mode
key_set('n', '[o', 'moO<ESC>`o', { desc = 'Empty Line above' })
key_set('n', ']o', 'moo<ESC>`o', { desc = 'Empty Line below' })

-- Split Line
key_set('n', '|', 'i<CR><Esc>', { desc = 'Split line (Opposite of J)' })

-- Sessions
key_set('n', '<leader>qs', ':mksession! OPSession.vim<CR>', { desc = 'Make OP [s]ession' })
key_set('n', '<leader>ql', ':source Session.vim<CR>', { desc = '[l]oad session' })
key_set('n', '<leader>qL', ':source OPSession.vim<CR>', { desc = '[l]oad OP session' })
key_set('n', '<leader>qq', ':qa<CR>', { desc = '[q]uit all' })
key_set('n', '<leader>qQ', ':qa!<CR>', { desc = 'Discard and [q]uit all' })

-- Diagnostics
-- note: diagnostics are not exclusive to lsp servers
-- so these can be global keybindings
key_set('n', 'gl', vim.diagnostic.open_float, { desc = 'Open Diagnostic f[l]oat' })
key_set('n', '[d', diagnostic_jump(-1), { desc = 'Go to previous [d]iagnostic' })
key_set('n', ']d', diagnostic_jump(1), { desc = 'Go to next [d]iagnostic' })

-- Quickfix
key_set('n', '<C-q>', toggle_quickfix, { desc = 'Toggle Quickfix' })
key_set('n', '<leader><Tab>q', toggle_quickfix, { desc = 'Toggle [q]uickfix' })
key_set('n', '<leader><Tab>l', toggle_locallist, { desc = 'Toggle [l]ocal list' })
key_set('n', '<leader><Tab>w', toggle_wildignore, { desc = 'Toggle [w]ildignore' })

-- Diagnostic keymaps
key_set('n', '<leader>d', vim.diagnostic.setloclist, { desc = 'Open [d]iagnostic local list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
key_set('t', '<C-n><C-n>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Prev and next in command mode.
key_set('c', '<C-n>', '<down>', { desc = 'Next command' })
key_set('c', '<C-p>', '<up>', { desc = 'Previous command' })

-- open files
key_set('n', '<leader>fg', ':edit .gitignore<CR>', { desc = 'Open [f]ile .gitignore' })
key_set('n', '<leader>fe', ':edit .env<CR>', { desc = 'Open [f]ile .env' })
key_set('n', '<leader>fp', ':edit package.json<CR>', { desc = 'Open [f]ile package.json' })
