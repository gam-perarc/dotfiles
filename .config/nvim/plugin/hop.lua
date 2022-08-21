require'hop'.setup()

vim.api.nvim_set_keymap('', '<leader>hw',
                        "<cmd>lua require'hop'.hint_words()<cr>", {})

vim.api.nvim_set_keymap('', '<leader>hc',
                        "<cmd>lua require'hop'.hint_char1()<cr>", {})
