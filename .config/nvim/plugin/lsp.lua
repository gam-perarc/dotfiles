local nvim_lsp = require('lspconfig')
local cmp = require('cmp')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

vim.o.completeopt = 'menu,menuone,noselect'

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local sumneko_lua_config = {
    settings = {
        Lua = {
            runtime = {version = 'LuaJIT', path = runtime_path},
            diagnostics = {globals = {'vim'}},
            workspace = {library = vim.api.nvim_get_runtime_file("", true)},
            telemetry = {enable = false}
        }
    }
}

local servers = {
    bashls = {},
    dockerls = {
        root_dir = nvim_lsp.util.root_pattern("Dockerfile", "Dockerfile.dev")
    },
    jsonls = {},
    sumneko_lua = sumneko_lua_config,
    tsserver = {},
    yamlls = {}
}

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    local opts = {noremap = true, silent = true}

    -- LuaFormatter off
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gt', '<cmd>lua require(\'lsp\').definition_new_tab()<CR>', opts)
    buf_set_keymap('n', 'gv', '<cmd>lua require(\'lsp\').definition_vsplit()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[g', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']g', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    buf_set_keymap('n', '<space>j', '<cmd>lua vim.lsp.buf.document_highlight()<CR>', opts)
    buf_set_keymap('n', '<space>k', '<cmd>lua vim.lsp.buf.clear_references()<CR>', opts)

    vim.api.nvim_command [[ hi LspReferenceText ctermbg=8 ]]
    vim.api.nvim_command [[ hi LspReferenceWrite ctermbg=8 ]]
    vim.api.nvim_command [[ hi LspReferenceRead ctermbg=8 ]]
    -- LuaFormatter on
end

local union_config = function(c1, c2)
    for k, v in pairs(c2) do c1[k] = v end
    return c1
end

for lsp, lsp_config in pairs(servers) do
    local base_config = {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = {debounce_text_changes = 150}
    }
    local config = union_config(base_config, lsp_config)
    nvim_lsp[lsp].setup(config)
end

cmp.setup({
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        },
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
                -- elseif luasnip.expand_or_jumpable() then
                -- luasnip.expand_or_jump()
            else
                fallback()
            end
        end,
        ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
                -- elseif luasnip.jumpable(-1) then
                -- luasnip.jump(-1)
            else
                fallback()
            end
        end
    },
    sources = {{name = 'nvim_lsp'}}
})
