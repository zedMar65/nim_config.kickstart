return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  init = function()
    vim.o.laststatus = 3
    local config = require('lualine').get_config()
    local function insert_left(component)
      table.insert(config.sections.lualine_c, component)
    end

    local function insert_right(component)
      table.insert(config.sections.lualine_x, component)
    end

    local function get_hl_color(group, attr)
      local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
      return hl and hl[attr] or nil
    end
    insert_left {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      symbols = { error = ' ', warn = ' ', info = ' ' },
      diagnostics_color = {
        color_error = { fg = get_hl_color('ErrorMsg', 'fg') },
        color_warn = { fg = get_hl_color('WarningMsg', 'fg') },
        color_info = { fg = get_hl_color('Identifier', 'fg') },
      },
    }
    require('lualine').setup {
      options = { theme = 'tomorrow_night' },
    }
  end,
}
