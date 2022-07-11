local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    sources = {
        -- LuaFormatter off
        -- null_ls.builtins.code_actions.eslint, -- active
        -- null_ls.builtins.code_actions.gitrebase, -- active
        -- null_ls.builtins.code_actions.gitsigns,
        -- null_ls.builtins.code_actions.refactoring,
        -- null_ls.builtins.completion.tags, -- active
        -- null_ls.builtins.diagnostics.checkmake,
        -- null_ls.builtins.diagnostics.cppcheck,
        -- null_ls.builtins.diagnostics.cspell,
        -- null_ls.builtins.diagnostics.editorconfig_checker,
        -- null_ls.builtins.diagnostics.eslint, -- active
        -- null_ls.builtins.diagnostics.flake8,
        -- null_ls.builtins.diagnostics.golangci_lint,
        -- null_ls.builtins.diagnostics.hadolint,
        -- null_ls.builtins.diagnostics.jsonlint, -- active
        null_ls.builtins.diagnostics.luacheck, -- active
        -- null_ls.builtins.diagnostics.markdownlint, -- active
        -- null_ls.builtins.diagnostics.pydocstyle,
        -- null_ls.builtins.diagnostics.pylint,
        -- null_ls.builtins.diagnostics.revive,
        -- null_ls.builtins.diagnostics.shellcheck, -- active
        -- null_ls.builtins.diagnostics.sqlfluff.with({
        --     extra_args = {"--dialect", "postgres"}
        -- }),
        -- null_ls.builtins.diagnostics.staticcheck,
        -- null_ls.builtins.diagnostics.stylelint,
        -- null_ls.builtins.diagnostics.teal,
        -- null_ls.builtins.diagnostics.textlint,
        -- null_ls.builtins.diagnostics.tidy,
        -- null_ls.builtins.diagnostics.tsc, -- active
        -- null_ls.builtins.diagnostics.vint, -- active
        -- null_ls.builtins.diagnostics.yamllint,
        -- null_ls.builtins.diagnostics.zsh, -- active
        -- null_ls.builtins.formatting.autopep8,
        -- null_ls.builtins.formatting.black,
        -- null_ls.builtins.formatting.clang_format,
        -- null_ls.builtins.formatting.cmake_format,
        -- null_ls.builtins.formatting.fixjson,
        -- null_ls.builtins.formatting.gofmt,
        -- null_ls.builtins.formatting.gofumpt,
        -- null_ls.builtins.formatting.goimports,
        -- null_ls.builtins.formatting.golines,
        -- null_ls.builtins.formatting.jq,
        -- null_ls.builtins.formatting.json_tool,
        -- null_ls.builtins.formatting.lua_format, -- active
        -- null_ls.builtins.formatting.mdformat,
        -- null_ls.builtins.formatting.nginx_beautifier,
        -- null_ls.builtins.formatting.pg_format,
        -- null_ls.builtins.formatting.prettier, -- active
        -- null_ls.builtins.formatting.shellharden,
        -- null_ls.builtins.formatting.shfmt,
        -- null_ls.builtins.formatting.sqlfluff.with({
        --     extra_args = {"--dialect", "postgres"} -- change to your dialect
        -- }),
        -- null_ls.builtins.formatting.sqlformat,
        -- null_ls.builtins.formatting.sql_formatter,
        -- null_ls.builtins.formatting.stylelint,
        -- null_ls.builtins.formatting.stylua,
        -- null_ls.builtins.formatting.terrafmt,
        -- null_ls.builtins.formatting.terraform_fmt,
        -- null_ls.builtins.formatting.tidy,
        -- null_ls.builtins.formatting.uncrustify,
        -- null_ls.builtins.formatting.yapf
        -- LuaFormatter on
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({bufnr = bufnr})
                end
            })
        end
    end
})
