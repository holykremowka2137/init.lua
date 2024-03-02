require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ['<C-u>'] = false,
                ['<C-d>'] = false,
            },
        },
    },
}

pcall(require('telescope').load_extension, 'fzf')

local function find_git_root()
    local current_file = vim.api.nvim_buf_get_name(0)
    local current_dir
    local cwd = vim.fn.getcwd()
    if current_file == '' then
        current_dir = cwd
    else
        current_dir = vim.fn.fnamemodify(current_file, ':h')
    end

    local git_root = vim.fn.systemlist('git -C ' .. vim.fn.escape(current_dir, ' ') .. ' rev-parse --show-toplevel')[1]
    if vim.v.shell_error ~= 0 then
        print 'Not a git repository. Searching on current working directory'
        return cwd
    end
    return git_root
end

local function live_grep_git_root()
    local git_root = find_git_root()
    if git_root then
        require('telescope.builtin').live_grep {
            search_dirs = { git_root },
        }
    end
end

vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})

vim.keymap.set('n', '<leader>,', require('telescope.builtin').buffers)
vim.keymap.set('n', '<leader>.', require('telescope.builtin').oldfiles)
vim.keymap.set('n', '<leader>/', function()
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer' })

local function telescope_live_grep_open_files()
    require('telescope.builtin').live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
    }
end
vim.keymap.set('n', '<leader>f/', telescope_live_grep_open_files)
vim.keymap.set('n', '<leader>fs', require('telescope.builtin').builtin)
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files)
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files)
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags)
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string)
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep)
vim.keymap.set('n', '<leader>fG', ':LiveGrepGitRoot<cr>')
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics)
vim.keymap.set('n', '<leader>fr', require('telescope.builtin').resume)
