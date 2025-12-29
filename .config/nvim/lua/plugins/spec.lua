return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {'nvim-lua/plenary.nvim'}
    },
    {
        "m4xshen/hardtime.nvim",
        lazy = false,
        dependencies = { "MunifTanjim/nui.nvim" },
        opts = {},
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
    { "ojroques/vim-oscyank",
        config = function()
            -- Should be accompanied by a setting clipboard in tmux.conf, also see
            -- https://github.com/ojroques/vim-oscyank#the-plugin-does-not-work-with-tmux
            vim.g.oscyank_term = "default"
            vim.g.oscyank_max_length = 0  -- unlimited
            -- see https://github.com/ojroques/vim-oscyank#copying-from-a-register
            vim.api.nvim_create_autocmd("TextYankPost", {
              pattern = "*",
              callback = function()
                if vim.v.event.operator == "y" and vim.v.event.regname == "+" then
                  vim.cmd('OSCYankRegister +')
                end
              end,
            })
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
