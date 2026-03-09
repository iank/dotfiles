vim.cmd.source("~/.vimrc")
vim.opt.mouse = ""

require("config.lazy")

vim.g["sneak#label"] = true
vim.g.oscyank_term = 'osc52'

vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
  },
  paste = {
    ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
    ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
  },
}
