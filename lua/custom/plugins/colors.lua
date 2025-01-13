function SetColor(color)
  color = color or 'tokyonight'
  -- color = color or 'catppuccin'
  vim.cmd.colorscheme(color)

  SetTransparentBackground()
end

function SetTransparentBackground()
  -- vim.cmd.hi 'Comment gui=none'

  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })

  -- Set Dashboard
  vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = '#000000' })

  -- Set NvimTree background to transparent
  vim.api.nvim_set_hl(0, 'NvimTreeNormal', { bg = 'NONE' })
  vim.api.nvim_set_hl(0, 'NvimTreeNormalNC', { bg = 'NONE' })
  vim.api.nvim_set_hl(0, 'NvimTreeWinSeparator', { bg = 'NONE' })
  vim.api.nvim_set_hl(0, 'NvimTreeStatusLine', { bg = 'NONE' })
  vim.api.nvim_set_hl(0, 'NvimTreeStatusLineNC', { bg = 'NONE' })
end

return { -- You can easily change to a different colorscheme.
  -- Change the name of the colorscheme plugin below, and then
  -- change the command in the config to whatever the name of that colorscheme is.
  --
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    init = function()
      SetColor()
    end,
    config = function()
      require('tokyonight').setup {
        style = 'night',
        transparent = true,
      }

      -- Modify colors
      vim.api.nvim_create_autocmd('ColorScheme', {
        pattern = 'tokyonight',
        callback = function()
          vim.api.nvim_set_hl(0, 'Comment', { fg = '#5B648F' })
          vim.api.nvim_set_hl(0, 'DiagnosticUnnecessary', { fg = '#a9b1d6' })
          SetTransparentBackground()
        end,
      })
    end,
  },

  {
    'catppuccin/nvim',
    name = 'catppuccin',
    -- priority = 1000,
    -- init = function()
    --   SetColor()
    -- end,
    -- config = function()
    --   require('catppuccin').setup {
    --     flavour = 'mocha',
    --     transparent_background = true,
    --     integrations = {
    --       nvimtree = true,
    --     },
    --     highlight_overrides = {
    --       mocha = function(mocha)
    --         return {
    --           NvimTreeNormal = { bg = mocha.none },
    --         }
    --       end,
    --     },
    --   }
    -- end,
  },
  { 'rose-pine/neovim', name = 'rose-pine' },
}
