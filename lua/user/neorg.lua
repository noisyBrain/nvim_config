local neorg = SafeRequire('neorg')

neorg.setup {
  load = {
    ["core.defaults"] = {}, -- Loads default behaviour
    ["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
    ["core.norg.dirman"] = { -- Manages Neorg workspaces
      config = {
          workspaces = {
              degree_notes = "~/neorg/degree/notes",
              degree_tasks = "~/neorg/degree/tasks",
              personal_ideas = "~/neorg/personal/ideas",
              personal_notes = "~/neorg/personal/notes",
              personal_tasks = "~/neorg/personal/tasks",
              notes = "~/neorg/notes"
          },
          default_workspace = "notes"
      },
    },
    ["core.norg.completion"] = {
      config = {
        engine = "nvim-cmp",
        name = "[Neorg]"
      }
    }
  },
}
