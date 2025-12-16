return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'nvim-tree/nvim-web-devicons', -- optional, but recommended
    },
    auto_clean_after_session_restore = false, -- Automatically clean up broken neo-tree buffers saved in sessions
    lazy = false, -- neo-tree will lazily load itself
    init = function()
      vim.keymap.set('n', '<leader>;', function()
        vim.cmd 'Neotree action=focus'
      end, { desc = 'Open new floaterm window with python' })
    end,
  },
}
