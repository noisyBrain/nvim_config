local neorg = SafeRequire('neorg')

neorg.setup {
  load = {
    ["core.defaults"] = {}, -- Loads default behaviour
    ["core.concealer"] = {}, -- Adds pretty icons to your documents
    ["core.dirman"] = { -- Manages Neorg workspaces
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
    ["core.completion"] = {
      config = {
        engine = "nvim-cmp",
        name = "[Neorg]"
      }
    },
    ["core.export"] = {},
    ["core.export.markdown"] = {
      config = {
        extensions = { "all" }
      }
    }
  },
}
