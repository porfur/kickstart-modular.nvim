local zoom = false
local M = {}

-- Toggle functions
-- TODO: Make sure this works and fix it
M.toggle_wildignore = function()
  if vim.opt.wildignore == '' then
    vim.opt.wildignore = { '**/node_modules/**', '**/.git/**', '**/dist/**' } -- Re-enable
    print 'Wildignore: ON'
  else
    vim.opt.wildignore = '' -- Disable ignoring
    print 'Wildignore: OFF'
  end
end

M.toggle_quickfix = function()
  local qf_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win['quickfix'] == 1 then
      qf_exists = true
    end
  end

  if qf_exists then
    vim.cmd 'cclose'
    vim.cmd 'lclose'
  else
    vim.cmd 'copen'
  end
end

M.toggle_locallist = function()
  local loc_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win.loclist == 1 then
      loc_exists = true
    end
  end

  if loc_exists then
    vim.cmd 'lclose'
    vim.cmd 'cclose' -- Optional: close quickfix as well if you want
  else
    -- Only open location list if it has items, else warn
    local loclist = vim.fn.getloclist(0)
    if loclist and #loclist > 0 then
      vim.cmd 'lopen'
    else
      vim.notify('No location list available', vim.log.levels.WARN)
    end
  end
end

M.toggle_zoom = function()
  if zoom == true then
    zoom = false
    vim.cmd 'wincmd ='
    print 'wincmd ='
  else
    zoom = true
    vim.cmd 'resize 999 | vertical resize 999'
    print 'resize 999 | vertical resize 999'
  end
end

M.diagnostic_jump = function(count)
  return function()
    vim.diagnostic.jump { count = count, wrap = true }
  end
end

return M
