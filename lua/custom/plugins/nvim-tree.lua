local WIDTH_PERCENTAGE = 25

function Resize(percentage)
  percentage = percentage or WIDTH_PERCENTAGE

  local ratio = percentage / 100
  local width = math.floor(vim.go.columns * ratio)
  vim.cmd('tabdo NvimTreeResize ' .. width)
end

return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('nvim-tree').setup {
      -- this don't work?
      view = {
        -- width = WIDTH_PERCENTAGE,
        side = 'right',
      },
    }

    Resize()

    vim.api.nvim_create_autocmd({ 'VimResized' }, {
      desc = 'Resize nvim-tree if nvim window got resized',

      group = vim.api.nvim_create_augroup('NvimTreeResize', { clear = true }),
      callback = Resize,
    })

    vim.keymap.set('n', '<leader>tc', ':NvimTreeFindFile<CR>', { desc = 'Open NvimTree at current file' })
    vim.keymap.set('n', '<leader>tt', ':NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })
  end,
}
