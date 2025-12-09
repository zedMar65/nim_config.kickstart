-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
local plugins = {}

-- directory relative to process cwd, or use vim.fn.stdpath("config").."/lua/plugins"
local plugin_dir = vim.fn.stdpath 'config' .. '/lua/plugins'

local function scan(dir)
  local it, err = vim.loop.fs_scandir(dir)
  if not it then
    vim.notify('Failed to scan plugins dir: ' .. tostring(err), vim.log.levels.ERROR)
    return {}
  end

  local files = {}
  while true do
    local name, t = vim.loop.fs_scandir_next(it)
    if not name then
      break
    end
    if t == 'file' and name:match '%.lua$' then
      table.insert(files, name)
    end
  end
  return files
end

local files = scan(plugin_dir)
for _, name in ipairs(files) do
  local module = name:gsub('%.lua$', '') -- "foo.lua" -> "foo"
  if module ~= 'init' then -- exclude this file
    local ok, mod_or_err = pcall(require, 'plugins.' .. module)
    if ok then
      table.insert(plugins, mod_or_err)
    else
      vim.notify("Error loading plugin '" .. module .. "': " .. tostring(mod_or_err), vim.log.levels.WARN)
    end
  end
end

return plugins
-- The following comments only work if you have downloaded the kickstart repo, not just copy pasted the
-- init.lua. If you want these files, they are in the repository, so you can just download them and
-- place them in the correct locations.

-- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
--
--  Here are some example plugins that I've included in the Kickstart repository.
--  Uncomment any of the lines below to enable them (you will need to restart nvim).
--
-- require 'kickstart.plugins.debug',
-- require 'kickstart.plugins.indent_line',
-- require 'kickstart.plugins.lint',
-- require 'kickstart.plugins.autopairs',
-- require 'kickstart.plugins.neo-tree',
-- require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps

-- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
--    This is the easiest way to modularize your config.
--
--  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
-- { import = 'custom.plugins' },
--
-- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
-- Or use telescope!
-- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
-- you can continue same window with `<space>sr` which resumes last telescope search
