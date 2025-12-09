-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
local plugins = {}
local command = package.config:sub(1, 1) == '\\' and 'dir /b *.lua' or 'ls *.lua'

for file in io.popen(command):lines() do
  table.inser(plugins, require(file))
end

return plugins
