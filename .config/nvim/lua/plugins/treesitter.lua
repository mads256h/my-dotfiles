return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      -- Additional textobjects for treesitter
      "nvim-treesitter/nvim-treesitter-textobjects",

      -- Context for stuff
      "nvim-treesitter/nvim-treesitter-context",
    },
    build = ":TSUpdate",
  }
}
