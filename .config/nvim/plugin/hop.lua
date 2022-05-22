require'hop'.setup()

vim.api.nvim_set_keymap('', '<leader>hw',
                        "<cmd>lua require'hop'.hint_words()<cr>", {})
