local configs = {}
local funcs = require "core.funcs"
local lvim = require "configs.global.lvim"
local keymaps = require "configs.global.keymaps"

configs['options'] = function()
    lvim.global()
    lvim.set()
end

configs['events'] = function()
    funcs.augroups({
        _general_settings = {
            {
                'TextYankPost', '*',
                'lua require(\'vim.highlight\').on_yank({higroup = \'Search\', timeout = 200})'
            }, {
                'BufWinEnter', '*',
                'setlocal formatoptions-=c formatoptions-=r formatoptions-=o'
            },
            {
                'BufRead', '*',
                'setlocal formatoptions-=c formatoptions-=r formatoptions-=o'
            }, {
                'BufNewFile', '*',
                'setlocal formatoptions-=c formatoptions-=r formatoptions-=o '
            }
        },
        _lsp = {
            {'FileType', '*', 'lua require("configs.global.filetypes").init()'}
        },
        _dashboard = {
            {
                'FileType', 'dashboard',
                'setlocal nocursorline noswapfile synmaxcol& signcolumn=no norelativenumber nocursorcolumn nospell  nolist  nonumber bufhidden=wipe colorcolumn= foldcolumn=0 matchpairs= '
            }, {
                'FileType', 'dashboard',
                'set showtabline=0 | autocmd BufLeave <buffer> set showtabline=2'
            }
        }
    })
end

configs['commands'] = function()
    -- LSP
    vim.cmd(
        'command! LspAddToWorkspaceFolder lua require("configs.global.utils").add_to_workspace_folder()')
    vim.cmd(
        'command! LspRemoveWorkspaceFolder lua require("configs.global.utils").remove_workspace_folder()')
    vim.cmd(
        'command! LspListWorkspaceFolders lua require("configs.global.utils").list_workspace_folders()')
    vim.cmd(
        'command! LspDocumentSymbol lua require("configs.global.utils").document_symbol()')
    vim.cmd(
        'command! LspWorkspaceSymbol lua require("configs.global.utils").workspace_symbol()')
    vim.cmd(
        'command! LspReferences lua require("configs.global.utils").references()')
    vim.cmd(
        'command! LspClearReferences lua require("configs.global.utils").clear_references()')
    vim.cmd(
        'command! LspCodeAction lua require("configs.global.utils").code_action()')
    vim.cmd(
        'command! LspRangeCodeAction lua require("configs.global.utils").range_code_action()')
    vim.cmd(
        'command! LspDeclaration lua require("configs.global.utils").declaration()')
    vim.cmd(
        'command! LspDefinition lua require("configs.global.utils").definition()')
    vim.cmd(
        'command! LspTypeDefinition lua require("configs.global.utils").type_definition()')
    vim.cmd(
        'command! LspDocumentHighlight lua require("configs.global.utils").document_highlight()')
    vim.cmd(
        'command! LspImplementation lua require("configs.global.utils").implementation()')
    vim.cmd(
        'command! LspIncomingCalls lua require("configs.global.utils").incoming_calls()')
    vim.cmd(
        'command! LspOutgoingCalls lua require("configs.global.utils").outgoing_calls()')
    vim.cmd(
        'command! LspFormatting lua require("configs.global.utils").formatting()')
    vim.cmd(
        'command! LspRangeFormatting lua require("configs.global.utils").range_formatting()')
    vim.cmd(
        'command! LspFormattingSync lua require("configs.global.utils").formatting_sync()')
    vim.cmd('command! LspHover lua require("configs.global.utils").hover()')
    vim.cmd('command! LspRename lua require("configs.global.utils").rename()')
    vim.cmd(
        'command! LspSignatureHelp lua require("configs.global.utils").signature_help()')
    -- Diagnostic
    vim.cmd('command! LspGetAll lua require("configs.global.utils").get_all()')
    vim.cmd('command! LspGetNext lua require("configs.global.utils").get_next()')
    vim.cmd('command! LspGetPrev lua require("configs.global.utils").get_prev()')
    vim.cmd(
        'command! LspGoToNext lua require("configs.global.utils").goto_next()')
    vim.cmd(
        'command! LspGoToPrev lua require("configs.global.utils").goto_prev()')
    vim.cmd(
        'command! LspToggleLineDiagnostics lua require("lsp.global.languages.virtualtext").toggle()')
    -- DAP
    vim.cmd('command! DapToggleBreakpoint lua require"dap".toggle_breakpoint()')
    vim.cmd('command! DapStart lua require"dap".continue()')
    vim.cmd('command! DapContinue lua require"dap".continue()')
    vim.cmd('command! DapStop lua require"dap".stop()')
    vim.cmd('command! DapRestart lua require"dap".restart()')
    vim.cmd('command! DapPause lua require"dap".pause()')
    vim.cmd('command! DapStepOver lua require"dap".step_over()')
    vim.cmd('command! DapStepOut lua require"dap".step_out()')
    vim.cmd('command! DapStepInto lua require"dap".step_into()')
    vim.cmd('command! DapToggleRepl lua require"dap".repl.toggle()')
    vim.cmd('command! DapGetSession lua require"dap".session()')
    -- GIT signs
    vim.cmd(
        'command! GitSignsPreviewHunk lua require("configs.global.utils").preview_hunk()')
    vim.cmd(
        'command! GitSignsNextHunk lua require("configs.global.utils").next_hunk()')
    vim.cmd(
        'command! GitSignsPrevHunk lua require("configs.global.utils").prev_hunk()')
    vim.cmd(
        'command! GitSignsStageHunk lua require("configs.global.utils").stage_hunk()')
    vim.cmd(
        'command! GitSignsUndoStageHunk lua require("configs.global.utils").undo_stage_hunk()')
    vim.cmd(
        'command! GitSignsResetHunk lua require("configs.global.utils").reset_hunk()')
    vim.cmd(
        'command! GitSignsResetBuffer lua require("configs.global.utils").reset_buffer()')
    vim.cmd(
        'command! GitSignsBlameLine lua require("configs.global.utils").blame_line()')
end

configs['keymaps'] = function()
    -- normal
    funcs.keymaps('n', {noremap = true, silent = true}, keymaps.normal)
    -- visual
    funcs.keymaps('x', {noremap = true, silent = true}, keymaps.visual)
end

return configs