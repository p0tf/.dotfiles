local buftabline = require('buftabline')
buftabline.setup {
  tab_format = " #{i} #{b}#{f} ",
  icon_colors = false,
  start_hidden = true,
  auto_hide = true,
  go_to_maps = false,
  flags = {
    modified = " ",
    not_modifiable = " ",
    readonly = " ",
  },
  hlgroups = {
    current = "Normal",
    normal = "Ignore",
    active = "LineNr",
    modified_current = "DiffAdd",
  }
}

vim.fn["leadermap#csmap"]('b', 'BufPrev', 'BufNext')
buftabline.map { prefix = "<Leader>b", cmd = "buffer" }
