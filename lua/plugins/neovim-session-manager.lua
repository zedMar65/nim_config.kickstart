return {
  {
    'Shatur/neovim-session-manager',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },

    init = function()
      vim.keymap.set('n', '<leader>wl', function()
        vim.cmd 'SessionManager load_session'
      end, { desc = 'Load session' })
      vim.keymap.set('n', '<leader>wr', function()
        vim.cmd 'SessionManager delete_session'
      end, { desc = 'Delete session' })
      vim.keymap.set('n', '<leader>ws', function()
        vim.cmd 'SessionManager save_current_session'
      end, { desc = 'Save current session' })
      vim.api.nvim_create_autocmd({ 'User' }, {
        pattern = 'SessionLoadPost',
        group = config_group,
        callback = function()
          vim.cmd 'Neotree action=focus'
        end,
      })
      vim.api.nvim_create_autocmd({ 'User' }, {
        pattern = 'SessionSavePost',
        group = config_group,
        callback = function()
          vim.cmd 'Neotree action=focus'
        end,
      })
    end,
  },
}
