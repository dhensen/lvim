-- Install Lsp server
-- :LspInstall angularls

local global = require("core.global")
local funcs = require("core.funcs")
local languages_setup = require("languages.global.utils")
local nvim_lsp_util = require("lspconfig/util")
local lsp_signature = require("lsp_signature")
local default_debouce_time = 150

local language_configs = {}

language_configs["lsp"] = function()
    local function start_angularls(server)
        server:setup {
            flags = {
                debounce_text_changes = default_debouce_time
            },
            autostart = true,
            filetypes = {"typescript", "html", "typescriptreact", "typescript.tsx"},
            on_attach = function(client, bufnr)
                table.insert(global["languages"]["angular"]["pid"], client.rpc.pid)
                vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
                lsp_signature.on_attach(languages_setup.config_lsp_signature)
                languages_setup.document_highlight(client)
            end,
            capabilities = languages_setup.get_capabilities(),
            root_dir = nvim_lsp_util.root_pattern("angular.json")
        }
    end
    local project_root_path = vim.fn.getcwd()
    if funcs.file_exists(project_root_path .. "/angular.json") then
        languages_setup.setup_lsp("angularls", start_angularls)
    end
end

return language_configs
