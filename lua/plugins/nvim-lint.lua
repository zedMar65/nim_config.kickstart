return --{}
{
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile', 'VimEnter' },
  init = function()
    local lint = require 'lint'

    lint.linters_by_ft = {
      python = { 'flake8' },
      make = { 'mbake' },
      cmake = { 'cmakelint' },
      c = { 'cppcheck' },
      cpp = { 'cppcheck' },
      lua = { 'luacheck' },
      sh = { 'shellcheck' },
    }

    -- Check if any attached LSP can publish diagnostics
    local function lsp_can_diagnose(bufnr)
      for _, client in ipairs(vim.lsp.get_active_clients { bufnr = bufnr }) do
        if client.supports_method 'textDocument/publishDiagnostics' then
          return true
        end
      end
      return false
    end

    vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufWritePost', 'InsertLeave' }, {
      callback = function(args)
        local bufnr = args.buf

        -- Prefer LSP diagnostics if available
        if lsp_can_diagnose(bufnr) then
          return
        end

        -- Otherwise run external linters
        lint.try_lint()
      end,
    })
  end,
}
