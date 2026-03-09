return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {'nvim-lua/plenary.nvim'}
    },
    {
      'Julian/lean.nvim',
      event = { 'BufReadPre *.lean', 'BufNewFile *.lean' },
      dependencies = {
        'nvim-lua/plenary.nvim',
      },

      ---@type lean.Config
      opts = {
        mappings = true,
      }
    },
    { 'alexghergh/nvim-tmux-navigation', config = function()
        local nvim_tmux_nav = require('nvim-tmux-navigation')

        nvim_tmux_nav.setup {
            disable_when_zoomed = true -- defaults to false
        }

        vim.keymap.set('n', "<M-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
        vim.keymap.set('n', "<M-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
        vim.keymap.set('n', "<M-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
        vim.keymap.set('n', "<M-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
    end
    },
    { "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" }
        }
    },
}
