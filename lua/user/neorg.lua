local neorg = SafeRequire('neorg')

neorg.setup {
  load = {
    ["core.defaults"] = {}, -- Loads default behaviour
    ["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
    ["core.norg.dirman"] = { -- Manages Neorg workspaces
      config = {
          workspaces = {
              notes = "~/neorg/degree/notes",
              ideas = "~/neorg/degree/ideas",
              projects = "~/neorg/project/ideas",
          },
          default_workspace = "~/neorg/quick_notes"
      },
    },
  },
}
