return {
  'amitds1997/remote-nvim.nvim',
  version = '*', -- Pin to GitHub releases
  dependencies = {
    'nvim-lua/plenary.nvim', -- For standard functions
    'MunifTanjim/nui.nvim', -- To build the plugin UI
    'nvim-telescope/telescope.nvim', -- For picking b/w different remote methods
  },
  init = function()
    local utils = require 'remote-nvim.utils'
    local constants = require 'remote-nvim.constants'

    require('remote-nvim').setup {
      providers = {
        ssh = {
          hosts = {
            pwn_college = {
              -- Use offline mode
              offline_mode = {
                enabled = true, -- enable offline mode for this host
                no_github = true, -- avoid any GitHub queries
                cache_dir = utils.path_join(vim.fn.stdpath 'cache', constants.PLUGIN_NAME, 'version_cache'),
              },

              -- Use system nvim instead of trying to download one
              system_nvim = true,

              -- Disable the progress UI to prevent buffer errors
              ui = {
                progress_view = {
                  enabled = false,
                },
              },

              -- Avoid TTY / banners that can break RPC
              ssh = {
                extra_args = { '-T' },
              },
            },
          },
        },
      },
    }
  end,
  config = true,
}
