local lsp = require('feline.providers.lsp')
local vi_mode_utils = require('feline.providers.vi_mode')

local force_inactive = {
  filetypes = {},
  buftypes = {},
  bufnames = {}
}

local components = {
  active = {{}, {}, {}},
  inactive = {{}, {}, {}},
}

local separators = {
  vertical_bar = '┃',
  vertical_bar_thin =	'│',
  left = '',
  right = '',
  block = '█',
  left_filled = '',
  right_filled = '',
  slant_left = '',
  slant_left_thin =	'',
  slant_right = '',
  slant_right_thin = '',
  slant_left_2 = '',
  slant_left_2_thin =	'',
  slant_right_2 = '',
  slant_right_2_thin = '',
  left_rounded = ' ',
  left_rounded_thin = '',
  right_rounded = '',
  right_rounded_thin = '',
  circle = '',
  circle_thin = ' '
}

---@diagnostic disable-next-line: unused-local
local unused_colors = {
  bg = '#1e1e2e',
  black = '#11111b',
  yellow = '#f9e2af',
  cyan = '#74c7ec',
  oceanblue = '#89b4fa',
  green = '#a6e3a1',
  orange = '#fab387',
  violet = '#b4befe',
  magenta = '#cba6f7',
  white = '#f5e0dc',
  fg = '#f2cdcd',
  skyblue = '#89dceb',
  red = '#f38ba8',
}

local colors = {
  bg = '#1e1e2e',
  black = '#11111b',
  orange_yellow = '#E5C07B',
  turquesa = '#56B6C2',
  oceanblue = '#89b4fa',
  green2 = '#33ff99',
  anaranjado = '#ff9966',
  orange = '#ff9900',
  violet = '#b4befe',
  magenta = '#cba6f7',
  white = '#f5e0dc',
  fg = '#f2cdcd',
  lightblue = '#61AFEF',
  moradito = '#ac72f3',
  red = '#E06C75',
  naranjita = '#ffb399',
  lila = '#ac72f3'
}

local vi_mode_colors = {
  NORMAL = 'anaranjado',
  OP = 'anaranjado',
  INSERT = 'red',
  VISUAL = 'moradito',
  LINES = 'moradito',
  BLOCK = 'moradito',
  REPLACE = 'violet',
  ['V-REPLACE'] = 'violet',
  ENTER = 'cyan',
  MORE = 'cyan',
  SELECT = 'orange',
  COMMAND = 'anaranjado',
  SHELL = 'anaranjado',
  TERM = 'anaranjado',
  NONE = 'orange_yellow'
}

local vi_mode_text = {
  NORMAL = ' ' .. separators.slant_left .. separators.slant_right_2,
  OP = ' ',
  INSERT = separators.left_rounded .. separators.right_rounded,
  VISUAL = ' ' .. separators.circle_thin,
  LINES = ' ' .. separators.left_filled .. separators.right_filled,
  BLOCK = ' █',
  REPLACE = ' ',
  ['V-REPLACE'] = ' ',
  ENTER = '<> ',
  MORE = separators.slant_left,
  SELECT = '  ',
  COMMAND = '  ',
  SHELL = '',
  TERM = ' ',
  NONE = ' '
}

force_inactive.filetypes = {
  'NvimTree',
  'dbui',
  'packer',
  'startify',
  'fugitive',
  'fugitiveblame'
}

force_inactive.buftypes = {
  'terminal'
}

-- // LEFT //

-- vi-mode
components.active[1][1] = {
  provider = '  ',
  hl = function()
    local val = {}

    val.bg = vi_mode_utils.get_mode_color()
    val.fg = 'black'
    val.style = 'bold'

    return val
  end,

  right_sep = {
    str = separators.slant_right_2,
    hl = function()
      local val = {}

      val.fg = vi_mode_utils.get_mode_color()

      return val
    end
  }
}

-- vi-symbol
components.active[1][2] = {
  provider = function()
    return vi_mode_text[vi_mode_utils.get_vim_mode()]
  end,

  hl = function()
    local val = {}

    val.fg = vi_mode_utils.get_mode_color()
    val.bg = 'bg'
    val.style = 'bold'

    return val
  end,
}

-- filename
components.active[1][3] = {
  provider = function()
    return vim.fn.expand("%:F")
  end,

  hl = function ()
    local val = {}

    val.fg = 'black'
    val.bg = '#ffff99'
    val.style = 'bold'

    return val
  end,

  left_sep = {
    str = ' ' .. separators.slant_left,
    hl = {
      fg = '#ffff99',
      bg = 'bg'
    }
  },

  right_sep = {
    str = separators.right_rounded,
    hl = function()
      local val = {}

      val.fg ='#ffff99'

      return val
    end
  }
}

-- // MID //

-- gitBranch
components.active[2][1] = {
  provider = 'git_branch',

  hl = {
    fg = 'black',
    bg = '#ff99cc',
    style = 'bold'
  },

  left_sep = {
    str = separators.left_rounded,
    h1 = {
      fg = '#ff99cc',
      bg = 'bg'
    }
  },

  right_sep = {
    str = separators.right_rounded,
    h1 = {
      fg = '#ff99cc',
      bg = 'bg'
    }
  }
}
-- diffAdd
components.active[2][2] = {
  provider = 'git_diff_added',

  hl = {
    fg = '#99ff99',
    bg = 'bg',
    style = 'bold'
  },
}

-- diffModfified
components.active[2][3] = {
  provider = 'git_diff_changed',
  hl = {
    fg = 'naranjita',
    bg = 'bg',
    style = 'bold'
  },
}

-- diffRemove
components.active[2][4] = {
  provider = 'git_diff_removed',
  hl = {
    fg = 'red',
    bg = 'bg',
    style = 'bold'
  },
}
-- diagnosticErrors
components.active[2][5] = {
  provider = 'diagnostic_errors',

  enabled = function()
    return lsp.diagnostics_exist(vim.diagnostic.severity.ERROR)
  end,

  hl = {
    fg = 'red',
    style = 'bold'
  },
}
-- diagnosticWarn
components.active[2][6] = {
  provider = 'diagnostic_warnings',

  enabled = function()
    return lsp.diagnostics_exist(vim.diagnostic.severity.WARN)
  end,

  hl = {
    fg = '#ffff80',
    style = 'bold'
  },
}
-- diagnosticHint
components.active[2][7] = {
  provider = 'diagnostic_hints',

  enabled = function()
    return lsp.diagnostics_exist(vim.diagnostic.severity.HINT)
  end,

  hl = {
    fg = '#99ccff',
    style = 'bold'
  },
}
-- diagnosticInfo
components.active[2][8] = {
  provider = 'diagnostic_info',

  enabled = function()
    return lsp.diagnostics_exist(vim.diagnostic.severity.INFO)
  end,

  hl = {
    fg = 'moradito',
    style = 'bold'
  },
}

-- // RIGHT //

-- LspName
components.active[3][1] = {
  provider = 'lsp_client_names',
  hl = {
    fg = 'black',
    bg = 'lila',
    style = 'bold'
  },

  left_sep = {
    str = separators.left_rounded,
    hl = {
      fg = 'lila',
      bg = 'bg'
    }
  },

  right_sep = {
    str = separators.slant_right_2,
    hl = {
      fg = 'lila',
      bg = 'bg'
    }
  },
}

-- fileIcon
components.active[3][2] = {
  provider = function()

    local filename = vim.fn.expand('%:t')
    local extension = vim.fn.expand('%:e')
    local icon  = require'nvim-web-devicons'.get_icon(filename, extension)

    if icon == nil then
      icon = ''
    end
    return icon

  end,

  hl = function()

    local val = {}
    local filename = vim.fn.expand('%:t')
    local extension = vim.fn.expand('%:e')
    local icon, name  = require'nvim-web-devicons'.get_icon(filename, extension)

    if icon ~= nil then
      val.fg = vim.fn.synIDattr(vim.fn.hlID(name), 'fg')
    else
      val.fg = 'white'
    end

    val.bg = 'bg'
    val.style = 'bold'

    return val
  end,

  left_sep = {
    str = separators.left_rounded,
    hl = {
      fg = 'bg',
    }
  },

  right_sep = {
    str = ' ',
    hl = {
      bg = 'bg'
    }
  }
}
-- fileType
components.active[3][3] = {
  provider = 'file_type',

  hl = function()
    local val = {}
    local filename = vim.fn.expand('%:t')
    local extension = vim.fn.expand('%:e')
    local icon, name  = require'nvim-web-devicons'.get_icon(filename, extension)

    if icon ~= nil then
      val.fg = vim.fn.synIDattr(vim.fn.hlID(name), 'fg')
    else
      val.fg = 'black'
    end

    val.bg = 'bg'
    val.style = 'bold'
    return val
  end,

  right_sep = {
    str = separators.slant_right .. ' ',
    hl = {
      fg = 'bg'
    }
  }
}

-- fileSize
components.active[3][4] = {
  provider = 'file_size',

  enabled = function()
    return vim.fn.getfsize(vim.fn.expand('%:t')) > 0
  end,

  hl = {
    fg = 'moradito',
    bg = 'bg',
    style = 'bold'
  },
  right_sep = ' '
}

-- fileFormat
components.active[3][5] = {
  provider = function()
    return vim.bo.fileformat:upper() .. ' '
  end,

  hl = {
    fg = 'black',
    bg = 'white',
    style = 'bold'
  },

  left_sep = {
    str = separators.slant_left_2,
    h1 = {
      fg = 'white',
      bg = 'bg'
    }
  },

  right_sep = ' '
}

-- // INACTIVE //

-- fileType
components.inactive[1][1] = {
  provider = 'file_type',

  hl = {
    fg = 'black',
    bg = 'cyan',
    style = 'bold'
  },

  left_sep = {
    str = ' ',
    hl = {
      fg = 'NONE',
      bg = 'cyan'
    }
  },

  right_sep = {
    {
      str = ' ',
      hl = {
        fg = 'NONE',
        bg = 'cyan'
      }
    },
    ' '
  }
}

require('feline').setup({
  theme = colors,
  default_bg = colors.bg,
  default_fg = colors.fg,
  vi_mode_colors = vi_mode_colors,
  components = components,
  force_inactive = force_inactive,
})
