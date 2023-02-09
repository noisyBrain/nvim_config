local db = SafeRequire("dashboard")

-- dashboard.setup {
--   config = {
--     header = {
--       [[                              \\\\\\\]],
--       [[                            \\\\\\\\\\\\]],
--       [[                          \\\\\\\\\\\\\\\]],
--       [[  -----------,-|           |C>   // )\\\\|]],
--       [[           ,','|          /    || ,'/////|]],
--       [[---------,','  |         (,    ||   /////]],
--       [[         ||    |          \\  ||||//''''|]],
--       [[         ||    |           |||||||     _|]],
--       [[         ||    |______      `````\____/ \]],
--       [[         ||    |     ,|         _/_____/ \]],
--       [[         ||  ,'    ,' |        /          |]],
--       [[         ||,'    ,'   |       |         \  |]],
--       [[_________|/    ,'     |      /           | |]],
--       [[_____________,'      ,',_____|      |    | |]],
--       [[             |     ,','      |      |    | |]],
--       [[             |   ,','    ____|_____/    /  |]],
--       [[             | ,','  __/ |             /   |]],
--       [[_____________|','   ///_/-------------/   |]],
--       [[              |===========,']],
--     },
--       center  = {
--        {
--         icon = '🌑',
--         icon_hl = 'group',
--         desc = 'find files',
--         desc_hl = 'group',
--         key = 'SPC ff',
--         key_hl = 'WildMenu',
--         action = 'Telescope find_files',
--       },
--       {
--         icon = '🌑',
--         icon_hl = 'group',
--         desc = 'recent files',
--         desc_hl = 'group',
--         key = 'SPC TR',
--         key_hl = 'group',
--         action = 'Telescope oldfiles',
--       },
--       {
--         icon = '🌑',
--         icon_hl = 'group',
--         desc = 'new vertical file',
--         desc_hl = 'group',
--         key = 'SPC fv',
--         key_hl = 'group',
--         action = '<cmd>vsplit<cr>',
--       },
--       {
--         icon = '🌑',
--         icon_hl = 'group',
--         desc = 'new horizontal file',
--         desc_hl = 'group',
--         key = 'SPC fh',
--         key_hl = 'group',
--         action = '<cmd>split',
--       },
--       packages = { enable = true },
--       project = { limit = 8, action = 'Telescope find_files cwd='},
--       mru = {limit = 10}
--     }
--   }
-- }

db.setup({
  theme = 'doom',
  config = {
    header = {
      [[                              \\\\\\\]],
      [[                            \\\\\\\\\\\\]],
      [[                          \\\\\\\\\\\\\\\]],
      [[  -----------,-|           |C>   // )\\\\|]],
      [[           ,','|          /    || ,'/////|]],
      [[---------,','  |         (,    ||   /////]],
      [[         ||    |          \\  ||||//''''|]],
      [[         ||    |           |||||||     _|]],
      [[         ||    |______      `````\____/ \]],
      [[         ||    |     ,|         _/_____/ \]],
      [[         ||  ,'    ,' |        /          |]],
      [[         ||,'    ,'   |       |         \  |]],
      [[_________|/    ,'     |      /           | |]],
      [[_____________,'      ,',_____|      |    | |]],
      [[             |     ,','      |      |    | |]],
      [[             |   ,','    ____|_____/    /  |]],
      [[             | ,','  __/ |             /   |]],
      [[_____________|','   ///_/-------------/   |]],
      [[              |===========,']],
    },
    center = {
      {
        icon = ' ',
        icon_hl = 'Title',
        desc = 'Find File           ',
        desc_hl = 'String',
        key = 'b',
        keymap = 'SPC f f',
        key_hl = 'Number',
        action = 'lua print(2)'
      },
      {
        icon = ' ',
        desc = 'Find Dotfiles',
        key = 'f',
        keymap = 'SPC f d',
        action = 'lua print(3)'
      },
    },
    footer = {}  --your footer
  }
})
