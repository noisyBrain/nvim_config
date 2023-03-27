local key = SafeRequire("which-key")

if not key then
  return
end

key.setup {
plugins = {
    marks = false, -- shows a list of your marks on ' and `
    registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- spelling = {
    --   enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
    --   suggestions = 20, -- how many suggestions should be shown in the list?
    -- },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = false, -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = false, -- default bindings on <c-w>
      nav = false, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = false, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = '<c-d>', -- binding to scroll down inside the popup
    scroll_up = '<c-u>', -- binding to scroll up inside the popup
  },
  window = {
    border = "none", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "center", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = false, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n",
  prefix = "",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
}

local files = {
  name = "Files",
  b = { ":Telescope buffers<cr>", "find open buffers" },
  e = { ":NvimTreeToggle<cr>", "show tree" },
  f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "find files" },
  g = { ":Telescope live_grep<cr>", "search any world" },
  h = { "<cmd>lua require('telescope.builtin').help_tags()<cr>", "help tags" },
  n = { "<cmd>lua require('telescope.builtin').find_files({ prompt_title = ' Find config ', cwd = '~/.config/nvim/'})<cr>", "find nvim config" },
}

local gs = require("gitsigns")

 local git = {
   name = "Git",
   n = {
     function()
       if vim.wo.diff then return ']c' end
       vim.schedule(function() gs.next_hunk() end)
       return '<Ignore>'
     end, "go to next hunk",
   },
   p = {
     function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
     end, "go to previous hunk",
   },
   a = { "<cmd>Gitsigns blame_line<cr>", "simple git blame" },
   b = { "<cmd>Gitsigns stage_buffer<cr>", "stage buffer" },
   c = { "<cmd>DiffviewClose<cr>", "close gitdiff" },
   d = { gs.diffthis, "show diff in the file" },
   g = { "<cmd>Neogit kind=tab<cr>", "Git management" },
   s = { "<cmd>Gitsigns stage_hunk<cr>", "stage hunk" },
   r = { "<cmd>Gitsigns reset_hunk<cr>", "reset hunk" },
   u = { gs.undo_stage_hunk, "undo stage junk" },
   v = { "<cmd>DiffviewOpen<cr>", "show diff in any files"},
   B = { function() gs.blame_line({full = true}) end, "blame line" },
   P = { gs.preview_hunk, "preview hunk" },
   R = { gs.reset_buffer, "reset buffer" },
 }

 local lsp = {
   name = "Lsp",
   a = { ':Lspsaga code_action<cr>', 'code action' },
   f = { ':Lspsaga lsp_finder<cr>', 'find definitions and references' },
   o = { ':Lspsaga hover_doc<cr>', 'show documentation' },
   r = { ':Lspsaga rename<cr>', "rename identifiers"},
   p = { ':Lspsaga peek_definition<cr>', "preview definition"},
   d = { ':Lspsaga show_line_diagnostics<cr>', "show inline diagnostics"},
   ["[e"] = { ':Lspsaga diagnostic_jump_prev<cr>', "goto previous error"},
   ["]e"] = { ':Lspsaga diagnostic_jump_next<cr>', "goto next error"},
 }

local neorg = {
  name = "Neorg",
  d = { ':Neorg workspace default<cr>', "take notes inside default dir" },
  n = { ':Neorg workspace degree_notes<cr>', "take notes inside degree_notes" },
  t = { ':Neorg workspace degree_tasks<cr>', "take tasks inside degree_tasks" },
  pi = { ':Neorg workspace personal_ideas<cr>', "take notes inside personal_ideas" },
  pn = { ':Neorg workspace personal_notes<cr>', "take notes inside personal_notes" },
  pt = { ':Neorg workspace personal_tasks<cr>', "take notes inside personal_tasks" },
  r = { ':Neorg return<cr>', "go to previous note" },
}

local noice = {
  name = "Noice",
  t = { ":NoiceTelescope<cr>", "show noice output in telescope" }
}

 local test = {
   name = "Testing",
   n = { function() require("neotest").jump.next({status = 'failed'}) end, "jump next failed test"},
   p = { function() require("neotest").jump.prev({status = 'failed'} )end, "jump next failed test"},
   s = { function() require("neotest").summary.toggle() end, "test summary"},
   a = { function() require('neotest').run.attach({}) end, "attach to the current test runner"},
   S = { function() require('neotest').run.stop({}) end, "stop test" },
   r = { function() require('neotest').run.run()  end, "run current test" },
   l = { function() require('neotest').run.run_last()  end, "run last test" },
   o = { function() require('neotest').output.open({enter = true, short = true}) end, "open test output"},
   R = { function() require('neotest').run.run(vim.fn.expand('%')) end, "run all test in this file"},
  }

 local github = {
   name = "Github",
   c = {
     name = "+commits",
     c = { "<cmd>GHCloseCommit<cr>", "Close" },
     e = { "<cmd>GHExpandCommit<cr>", "Expand" },
     o = { "<cmd>GHOpenToCommit<cr>", "Open To" },
     p = { "<cmd>GHPopOutCommit<cr>", "Pop Out" },
     z = { "<cmd>GHCollapseCommit<cr>", "Collapse" },
   },
   i = {
     name = "+issues",
     p = { "<cmd>GHPreviewIssue<cr>", "Preview" },
   },
   l = {
     name = "+litee",
     t = { "<cmd>LTPanel<cr>", "Toggle Panel" },
   },
   r = {
     name = "+review",
     b = { "<cmd>GHStartReview<cr>", "Begin" },
     c = { "<cmd>GHCloseReview<cr>", "Close" },
     d = { "<cmd>GHDeleteReview<cr>", "Delete" },
     e = { "<cmd>GHExpandReview<cr>", "Expand" },
     s = { "<cmd>GHSubmitReview<cr>", "Submit" },
     z = { "<cmd>GHCollapseReview<cr>", "Collapse" },
   },
   p = {
     name = "+pull Request",
     c = { "<cmd>GHClosePR<cr>", "Close" },
     d = { "<cmd>GHPRDetails<cr>", "Details" },
     e = { "<cmd>GHExpandPR<cr>", "Expand" },
     o = { "<cmd>GHOpenPR<cr>", "Open" },
     p = { "<cmd>GHPopOutPR<cr>", "PopOut" },
     r = { "<cmd>GHRefreshPR<cr>", "Refresh" },
     t = { "<cmd>GHOpenToPR<cr>", "Open To" },
     z = { "<cmd>GHCollapsePR<cr>", "Collapse" },
   },
   t = {
     name = "+threads",
     c = { "<cmd>GHCreateThread<cr>", "Create" },
     n = { "<cmd>GHNextThread<cr>", "Next" },
     t = { "<cmd>GHToggleThread<cr>", "Toggle" },
   },
 }

 local packer = {
   name = "Packer",
   s = {"<cmd>:PackerSync<cr>", "sync plugins"},
   c = {"<cmd>:PackerClean<cr>", "clean plugins"},
   i = {"<cmd>:PackerInstall<cr>", "install plugins"},
   l = {"<cmd>:PackerLoad ", "load plugin"},
   S = {"<cmd>:PackerStatus<cr>", "plugins status"},
 }

 local markown = {
   name = "Markdow",
   p = {"<cmd>:Glow<cr>", "Preview in neovim"},
   P = {"<cmd>:MarkdownPreview<cr>", "preview in the browser"}
 }

 local toggleterm = {
  name = "Term",
  f = { ":ToggleTerm direction=float<cr>", "open float terminal" },
  h = { ":ToggleTerm direction=horizontal size=20<cr>", "open horizontal terminal" },
  v = { ":ToggleTerm direction=vertical size=100<cr>", "open vertical terminal" },
  nh = { ":ToggleTerm dir=~/.config/nvim direction=horizontal size=20<cr>", "open horizontal terminal in neovim dir" },
  nv = { ":ToggleTerm dir=~/.config/nvim direction=vertical size=100<cr>", "open vertical terminal in neovim dir" },
}

 local zenmode = {
   name = "ZenMode",
   m = {"<cmd>:ZenMode<cr>", "Toggle ZenMode"},
 }

key.register(files, { prefix = "<leader>f" })
key.register(git, { prefix = "<leader>g" })
key.register(github, { prefix = "<leader>h" })
key.register(lsp, { prefix = "<leader>l" })
key.register(neorg, { prefix = "<leader>d" })
key.register(noice, { prefix = "," })
key.register(test, { prefix = "<leader>t" })
key.register(packer, { prefix = "<leader>p" })
key.register(markown, { prefix = "<leader>M" })
key.register(zenmode, { prefix = "<leader>z" })
key.register(toggleterm, { prefix = "<leader>q" })
