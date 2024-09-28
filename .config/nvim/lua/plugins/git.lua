return {
  "tpope/vim-fugitive", -- Git commands in nvim
  "tpope/vim-rhubarb",  -- Fugitive-companion to interact with github

  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}
