local buftabline = require('buftabline')
buftabline.setup {
  tab_format = " #{i} #{b} #{f} ",
  icon_colors = "current",
  start_hidden = false,
  auto_hide = false,
  go_to_maps = false,
  flags = {
    modified = " ",
    not_modifiable = " ",
    readonly = " ",
  },
  hlgroups = {
    current = "Normal",
    normal = "Tabline",
    active = "TablineSel",
    modified_current = "DiffAdd",
    spacing= "TablineFill",
  }
}

vim.fn["leadermap#csmap"]('b', 'BufPrev', 'BufNext')
buftabline.map { prefix = "<Leader>b", cmd = "buffer" }
