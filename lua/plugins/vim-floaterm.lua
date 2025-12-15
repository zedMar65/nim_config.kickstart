return {
  'voldikss/vim-floaterm',
  event = 'VimEnter',
  config = function()
    vim.keymap.set('n', '<leader>Ff', function()
      vim.cmd 'FloatermNew'
    end, { desc = 'Open new floaterm window' })

    vim.keymap.set('n', '<leader>Fp', function()
      vim.cmd 'FloatermNew python'
    end, { desc = 'Open new floaterm window with python' })

    vim.keymap.set('n', '<leader>Fg', function()
      vim.cmd 'FloatermNew lazygit'
    end, { desc = 'Open new floaterm window with lazygit' })
  end,
}
