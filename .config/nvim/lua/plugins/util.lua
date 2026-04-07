return {
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },
  {
    "vyfor/cord.nvim",
    build = ":Cord update",
    event = "VeryLazy",
  },
  { "nvim-tree/nvim-web-devicons", event = "VeryLazy" },
  {
    "b0o/SchemaStore.nvim",
    lazy = true,
    version = false,
  },
}
