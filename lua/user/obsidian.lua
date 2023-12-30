local obsidian = SafeRequire("obsidian")

obsidian.setup {
  workspaces = {
    {
      name = "personal",
      path = "~/Notes/zettel",
    },
  }
}
