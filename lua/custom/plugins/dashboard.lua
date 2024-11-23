local all_asciis = require 'constants.asciis'
math.randomseed(os.time())

-- Define table of favorite asciis to load in config
local favorites = {
  all_asciis.spy_family.anya.cool,
  all_asciis.spy_family.anya.smug,
  all_asciis.spy_family.anya.peace,
  all_asciis.spy_family.anya.scared,
  all_asciis.spy_family.anya.waku_waku,
}

local config = {
  --[[
asciis: A field that can be either:
    - A string 
    - A table or nested table of strings 
If asciis is a table, a random string is chosen from the table.
Otherwise, the single string is returned. 
]]
  asciis = all_asciis,
}

local function ascii_to_table(ascii)
  local lines = {}

  for line in ascii:gmatch '([^\n]*)\n?' do
    if line ~= '' then
      table.insert(lines, line)
    end
  end

  return lines
end

-- local function get_random_element(tbl)
--   local keyset = {}
--   for k in pairs(tbl) do
--     table.insert(keyset, k)
--   end
--
--   return tbl[keyset[math.random(#keyset)]]
-- end

local function flattenTable(inputTable, flattenedTable)
  flattenedTable = flattenedTable or {}

  for _, value in pairs(inputTable) do
    if type(value) == 'table' then
      flattenTable(value, flattenedTable)
    elseif type(value) == 'string' then
      table.insert(flattenedTable, value)
    end
  end

  return flattenedTable
end

local function getRandomString(inputTable)
  local flattenedTable = flattenTable(inputTable)
  if #flattenedTable > 0 then
    return flattenedTable[math.random(1, #flattenedTable)]
  else
    return nil
  end
end

local function get_header()
  local ascii

  if type(config.asciis) == 'string' then
    ascii = config.asciis
  elseif type(config.asciis) == 'table' then
    ascii = getRandomString(config.asciis)
  else
    ascii = config.asciis.spy_family.anya.waku_waku
  end

  return ascii_to_table(ascii)
end

return {
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        theme = 'hyper',
        config = {
          shortcut = {
            --   { desc = '[  Github]', group = 'DashboardShortCut' },
            --   { desc = '[  jj-choi]', group = 'DashboardShortCut' },
            --   { desc = '[  0.2.3]', group = 'DashboardShortCut' },
          },
          header = get_header(),
          week_header = {
            enable = false,
          },
          packages = { enable = false },
          footer = { '' },
        },
      }

      local header_color = vim.api.nvim_get_hl(0, { name = 'Statement' }) -- use :highlight Statement color

      if header_color then
        -- Convert the RGB integer to hexadecimal format (e.g., "#RRGGBB")
        local hex_color = string.format('#%06x', header_color.fg)

        vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = hex_color })
      else
        print 'No header color found.'
      end
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  },
}
