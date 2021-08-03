local gl = require('galaxyline')
local gls = gl.section
local cond = require('galaxyline.condition')

-- One Light
local colors = {
  dark_black = '#494b53',
  black = '#696c77',
  dark_grey = '#a0a1a7',
  grey = '#c2c2c3',
  cyan = '#0184bc',
  blue = '#4078f2',
  purple = '#a626a4',
  green = '#50a14f',
  dark_red = '#e45649',
  red = '#ca1243',
  dark_yellow = '#986801',
  yellow = '#c18401',
  bg_green = '#98c379',
  bg_purple = '#c678dd',
  bg_yellow = '#e5c07b',
  bg = '#fafafa',
  gutter = '#9e9e9e',
  cursor = '#f0f0f0',
  accent = '#526fff',
  accent2 = '#0083be',
  vertsplit = '#e7e9e1',
  special_grey = '#d3d3d3',
  visual_grey = '#d0d0d0',
  pmenu = '#dfdfdf',
  git = '#f14e32',
}

local function set_highlight(group, fg, bg, kind)
  if kind ~= '' then
    kind = ' gui=' .. kind
  end
  vim.cmd('hi Galaxy' .. group .. ' guifg=' .. fg .. ' guibg=' .. bg .. kind)
end

gls.left = {
  {
    ViMode = {
      provider = function()
        local alias = {
          n      = 'NOR',
          i      = 'INS',
          c      = 'CMD',
          v      = 'VIS',
          V      = 'VLINE',
          [''] = 'VBLOCK',
          s      = 'SEL',
          S      = 'SLINE',
          [''] = 'SBLOCK',
          R      = 'REP',
          t      = 'TER',
        }

        local mode_color = {
          n      = colors.green,
          i      = colors.blue,
          c      = colors.green,
          v      = colors.purple,
          V      = colors.purple,
          [''] = colors.purple,
          s      = colors.yellow,
          S      = colors.yellow,
          [''] = colors.yellow,
          R      = colors.dark_red,
          r      = colors.cyan,
          t      = colors.blue,
        }
        local mode = vim.fn.mode():sub(1, 1)
        set_highlight('ViMode', colors.bg, mode_color[mode], 'bold')
        return '  ' .. alias[mode] .. ' '
      end,
      highlight = {
      }
    },
  },
  {
    TrailingSpace = {
      provider = function() return '  ' end,
      condition = cond.buffer_not_empty,
      highlight = {colors.dark_black, colors.cursor},
    }
  },
  {
    FileIcon = {
      provider = 'FileIcon',
      condition = function()
        return cond.buffer_not_empty()
      end,
      highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color, colors.cursor},
    },
  },
  {
    FilePath = {
      provider = function()
        local max = vim.fn.winwidth(0) / 4
        local filename = vim.fn.expand('%:t')
        if #filename > max then
          return '...' .. filename:sub(-(max-3)) .. ' '
        else
          return filename .. ' '
        end
      end,
      condition = function()
        return cond.buffer_not_empty()
      end,
      highlight = {colors.dark_black, colors.cursor},
    }
  },
  {
    FileModified = {
      provider = function()
        if vim.bo.readonly and vim.bo.modified then
          set_highlight('FileModified', colors.dark_red, colors.cursor, '')
          return '  '
        elseif vim.bo.readonly then
          set_highlight('FileModified', colors.blue, colors.cursor, '')
          return '  '
        elseif vim.bo.modified then
          set_highlight('FileModified', colors.green, colors.cursor, '')
          return '  '
        end
      end,
      condition = function()
        return cond.buffer_not_empty()
      end,
      highlight = {colors.dark_black, colors.cursor},
    }
  },
  {
    GitIcon = {
      provider = function() return '   ' end,
      condition = cond.check_git_workspace,
      highlight = {colors.git, colors.bg},
    }
  },
  {
    GitBranch = {
      provider = 'GitBranch',
      highlight = {colors.dark_black, colors.bg},
    }
  },
  {
    Separator = {
      provider = function() return '   ' end,
      highlight = 'Normal',
    }
  },
  {
    DiffAdd = {
      provider = 'DiffAdd',
      icon = '  ',
      highlight = {colors.green, colors.bg},
    }
  },
  {
    DiffModified = {
      provider = 'DiffModified',
      icon = '  ',
      highlight = {colors.yellow, colors.bg},
    },
  },
  {
    DiffRemove = {
      provider = 'DiffRemove',
      icon = '  ',
      highlight = {colors.dark_red, colors.bg},
    }
  },
}
gls.right = {
  {
    DiagnosticError = {
      provider = 'DiagnosticError',
      condition = cond.hide_in_width,
      icon = '   ',
      highlight = 'LspDiagnosticsSignError',
    }
  },
  {
    DiagnosticWarn = {
      provider = 'DiagnosticWarn',
      condition = cond.hide_in_width,
      icon = '   ',
      highlight = 'LspDiagnosticsSignWarning',
    }
  },
  {
    DiagnosticInfo = {
      provider = 'DiagnosticInfo',
      condition = cond.hide_in_width,
      icon = '   ',
      highlight = 'LspDiagnosticsSignInformation',
    }
  },
  {
    DiagnosticHint = {
      provider = 'DiagnosticHint',
      condition = cond.hide_in_width,
      icon = '   ',
      highlight = 'LspDiagnosticsSignHint',
    }
  },
  {
    LineInfo = {
      provider = function()
        local line = vim.fn.line('.')
        local col = vim.fn.col('.')
        local total = vim.fn.line('$')
        return string.format("  %d:%d(%d%%) ", line, col, math.floor((line/total)*100+0.5))
      end,
      highlight = 'GalaxyViMode',
    }
  },
}
