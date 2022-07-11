require("formatter").setup {
    logging = true,
    log_level = vim.log.levels.WARN,
    filetype = {
        lua = {
            require("formatter.filetypes.lua").luaformat,
        },

        javascript = {
            require("formatter.filetypes.javascript").prettier
        },

        javascriptreact = {
            require("formatter.filetypes.javascriptreact").prettier
        },

        typescript = {
            require("formatter.filetypes.typescript").prettier
        },

        typescriptreact = {
            require("formatter.filetypes.typescriptreact").prettier
        },

        ["*"] = {
            require("formatter.filetypes.any").remove_trailing_whitespace
        }
    }
}

local group = "FormatAutogroup"

vim.api.nvim_create_augroup(group, { clear = true })

vim.api.nvim_create_autocmd('BufWritePost', {
    group = group,
    callback = function ()
        vim.api.nvim_command('FormatWrite')
    end
})
