return {
  {
    "vague2k/vague.nvim",
    enabled = false,
    priority = 1000,
    config = function()
      require("vague").setup({
        transparent = true,
        bold = true,
        italic = true,
      })
      vim.cmd.colorscheme("vague")
    end,
  },
  {
    'datsfilipe/vesper.nvim',
    priority = 1000,
    config = function()
      require("vesper").setup({
        transparent = true,
      })
      vim.cmd.colorscheme("vesper")
    end,
  },

}
