function SetColor(color)
  -- color = color or 'tokyonight'
  color = color or 'catppuccin'
  vim.cmd.colorscheme(color)

  vim.cmd.hi 'Comment gui=none'
  SetBackground()
end

function SetBackground()
  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = '#000000' })
end

return { -- You can easily change to a different colorscheme.
  -- Change the name of the colorscheme plugin below, and then
  -- change the command in the config to whatever the name of that colorscheme is.
  --
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  {
    'folke/tokyonight.nvim',
    -- priority = 1000,
    -- init = function()
    --   -- SetColor()
    -- end,
    -- config = function()
    --   require('tokyonight').setup {
    --     style = 'night',
    --     transparent = true,
    --   }
    -- end,
  },

  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    init = function()
      SetColor()
    end,
    config = function()
      require('catppuccin').setup {
        flavour = 'mocha',
        transparent_background = true,
        integrations = {
          nvimtree = true,
        },
        highlight_overrides = {
          mocha = function(mocha)
            return {
              NvimTreeNormal = { bg = mocha.none },
            }
          end,
        },
      }
    end,
  },
  { 'rose-pine/neovim', name = 'rose-pine' },
}
