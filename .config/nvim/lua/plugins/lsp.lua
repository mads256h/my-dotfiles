return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/neodev.nvim",
      "hrsh7th/nvim-cmp",         -- Autocompletion plugin
      "hrsh7th/cmp-nvim-lsp",     -- LSP source for nvim-cmp
      "saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
      "L3MON4D3/LuaSnip",         -- Snippets plugin
      {
        "ray-x/lsp_signature.nvim",
        config = function(_, opts) require'lsp_signature'.setup(opts) end
      }
    },
  }
}
