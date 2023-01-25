local neotest = SafeRequire("neotest")

neotest.setup  {
   adapters = {
     require("neotest-jest"),
  }
}
