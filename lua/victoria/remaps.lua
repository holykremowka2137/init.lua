vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local keyset = vim.keymap.set

keyset({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- keyset({ 'n' }, '<C-\>>' )

-- keyset('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- keyset('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

keyset('n', '[d', vim.diagnostic.goto_prev)
keyset('n', ']d', vim.diagnostic.goto_next)
keyset('n', '<leader>d', vim.diagnostic.open_float)
keyset('n', '<leader>q', vim.diagnostic.setloclist)

keyset('n', '<C-d>', '<C-d>zz')
keyset('n', '<C-u>', '<C-u>zz')

keyset('n', 'n', 'nzzzv')
keyset('n', 'N', 'Nzzzv')

keyset('n', 'G', 'Gzz')

keyset('n', '<leader>ee', vim.cmd.Ex)
keyset('n', '<leader>es', vim.cmd.Sex)
keyset('n', '<leader>ev', vim.cmd.Vex)
keyset('n', '<leader>el', vim.cmd.Lex)
