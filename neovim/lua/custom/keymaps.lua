local custom_pickers = require 'custom.pickers'
vim.keymap.set('i', 'jk', '<esc>', { noremap = true, silent = true })
vim.keymap.set('i', 'jj', '<esc>', { noremap = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = 'Move cursor down' })
vim.keymap.set('x', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = 'Move cursor down' })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = 'Move cursor up' })
vim.keymap.set('x', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = 'Move cursor up' })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '\\', '<CMD>:sp<CR>', { desc = 'Split window horizontally' })
vim.keymap.set('n', '|', '<CMD>:vsp<CR>', { desc = 'Split window vertically' })
vim.keymap.set('n', ']q', '<cmd>cnext<cr>', { desc = 'Go to next qf item' })
vim.keymap.set('n', '[q', '<cmd>cprev<cr>', { desc = 'Go to prev qf item' })
vim.keymap.set('n', '<C-d>', '5j', { desc = 'Scroll down by 5 lines' })
vim.keymap.set('n', '<C-u>', '5k', { desc = 'Scroll up by 5 lines' })
vim.keymap.set('n', 'L', '<C-^>', { noremap = true, desc = 'Go to next buffer' })
vim.keymap.set('n', 'H', '<C-^>', { noremap = true, desc = 'Go to prev buffer' })
vim.keymap.set('n', '+', '<C-w>|<C-w>_', { desc = 'Maximize nvim pane' })
vim.keymap.set('n', '=', '<C-w>=', { desc = 'Restore nvim panes' })
vim.keymap.set('v', 'p', '"_dP', { noremap = true })
vim.keymap.set('v', '<leader>p', 'p', { noremap = true })
vim.keymap.set('n', '<space>X', '<cmd>source %<cr>', { desc = 'Run this lua file' })
vim.keymap.set('n', '<space>x', ':.lua<cr>', { desc = 'Run this line' })
vim.keymap.set('v', '<space>x', ':lua<cr>', { desc = 'Run selection' })

local feedkeys = vim.api.nvim_feedkeys
local t = vim.api.nvim_replace_termcodes
vim.keymap.set('n', '<leader>tz', function()
  feedkeys(t('<leader>tg', true, true, true), 'm', false)
  feedkeys(t('<leader>th', true, true, true), 'm', false)
  feedkeys(t('<leader>td', true, true, true), 'm', false)
  feedkeys(t('<leader>tt', true, true, true), 'm', false)
end, { noremap = true, silent = true, desc = 'Toggle distraction free' })

vim.keymap.set('n', '<leader>fg', custom_pickers.pick_repositories)


-- LSP: hover documentation on 'K'
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { silent = true, desc = 'LSP: Hover Documentation' })
