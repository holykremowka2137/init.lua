vim.defer_fn(function()
    require'nvim-treesitter.configs'.setup {
        ensure_installed = {
            'lua',
            'python',
            'rust',
            'vimdoc',
            'vim',
            'bash',
            'yaml',
            'toml' ,
            'fish',
            'markdown',
            'markdown_inline',
            'lua',
            'luadoc',
            'gitignore',
        },

        sync_install = false,

        auto_install = true,

        highlight = {
            enable = true,

            additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = '<c-space>',
                node_incremental = '<c-space>',
                scope_incremental = '<c-s>',
                node_decremental = '<M-space>',
            },
        },
    }
end, 0)
