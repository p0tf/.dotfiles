local dial = require("dial")

table.insert(dial.config.searchlist.normal, "number#decimal#int")
table.insert(dial.config.searchlist.visual, "number#decimal#int")
table.insert(dial.config.searchlist.normal, "number#decimal#fixed#zero")
table.insert(dial.config.searchlist.visual, "number#decimal#fixed#zero")
table.insert(dial.config.searchlist.normal, "date#[%Y年%-m月%-d日]")
table.insert(dial.config.searchlist.visual, "date#[%Y年%-m月%-d日]")
table.insert(dial.config.searchlist.normal, "date#[%Y年%-m月%-d日(%ja)]")
table.insert(dial.config.searchlist.visual, "date#[%Y年%-m月%-d日(%ja)]")
table.insert(dial.config.searchlist.normal, "markup#markdown#header")
table.insert(dial.config.searchlist.visual, "markup#markdown#header")

dial.augends["custom#boolean"] = dial.common.enum_cyclic {
  name = "boolean",
  strlist = {"true", "false"},
}
table.insert(dial.config.searchlist.normal, "custom#boolean")
table.insert(dial.config.searchlist.visual, "custom#boolean")

vim.api.nvim_set_keymap('n', '<C-a>', '<Plug>(dial-increment)', {})
vim.api.nvim_set_keymap('n', '<C-x>', '<Plug>(dial-decrement)', {})
vim.api.nvim_set_keymap('v', '<C-a>', '<Plug>(dial-increment)', {})
vim.api.nvim_set_keymap('v', '<C-x>', '<Plug>(dial-decrement)', {})
vim.api.nvim_set_keymap('v', 'g<C-a>', '<Plug>(dial-increment-additional)', {})
vim.api.nvim_set_keymap('v', 'g<C-x>', '<Plug>(dial-decrement-additional)', {})
