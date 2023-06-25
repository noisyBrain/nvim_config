local neotest = SafeRequire("neotest")

neotest.setup({
   adapters = {
    require("neotest-jest")({
      ft = { "jasvascript", "typescripot" }
    }),
    require("neotest-python")({})
  }
})
