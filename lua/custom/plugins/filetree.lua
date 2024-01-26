return {
  'nvim-neo-tree/neo-tree.nvim',
  lazy = false,
  keys = {
    { '<leader>nt', '<cmd>Neotree toggle<cr>', desc = 'Toggle NeoTree' },
    { '<leader>nf', '<cmd>wincmd w<CR>', desc = 'Focus on NeoTree' },
  },
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  opts = {
    --[[ filesystem = {
      hijack_netrw_behaviour = "open_default"
    } ]]
  },
  config = function()
    require('neo-tree').setup({})
  end,
}
