-- Required packages
-- nvim-lazy
-- clang
-- rust-analyzer
-- omnisharp-roslyn
-- pyright
-- bash-language-server
-- cmake-language-server
-- haskell-language-server
-- lua-language-server

require('lazy').setup("plugins")

require('neodev').setup({})

-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require('nvim-treesitter.configs').setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,          -- false will disable the whole extension
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
}

local lspconfig = require('lspconfig')

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    --vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})


local cmp_lsp = require("cmp_nvim_lsp")


-- Add additional capabilities supported by nvim-cmp
local capabilities = cmp_lsp.default_capabilities()

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'rust_analyzer', 'pyright', 'tsserver', 'texlab', 'bashls', 'cmake', 'cssls', 'eslint', 'html',
  'jsonls', 'hls', 'lua_ls' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
  }
end

lspconfig.omnisharp.setup {
  cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(pid) },
  capabilities = capabilities,
}

-- Check if we are editing a esp32 project
local current_file = vim.fn.expand('%:p')
if current_file ~= "" and lspconfig.util.root_pattern('sdkconfig')(current_file) ~= nil then
  -- Esp32 specific stuff
  lspconfig.clangd.setup {
    capabilities = capabilities,
    cmd = {
      "clangd",
      '--query-driver=' .. os.getenv("HOME") .. '/.espressif/tools/xtensa-esp32-elf/esp-12.2.0_20230208/**/bin/xtensa-esp32-elf-*',
    },
  }
else
  lspconfig.clangd.setup {
    capabilities = capabilities,
  }
end
-- Set completeopt to have a better completion experience
--vim.o.completeopt = 'menuone,noselect'

-- luasnip setup
local luasnip = require('luasnip')

local lspkind = require("lspkind")

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
  formatting = {
    format = lspkind.cmp_format(),
  },
}

-- Gitsigns
require('gitsigns').setup {
  signs = {
    add = { hl = 'GitGutterAdd', text = '+' },
    change = { hl = 'GitGutterChange', text = '~' },
    delete = { hl = 'GitGutterDelete', text = '_' },
    topdelete = { hl = 'GitGutterDelete', text = '‾' },
    changedelete = { hl = 'GitGutterChange', text = '~' },
  },
}

-- Vim stuff
vim.keymap.set("n", "m", "<cmd>:Neotree toggle<CR>")

-- Current line in left gutter
vim.o.number = true
vim.o.relativenumber = true

-- Indentation
vim.o.autoindent = true
vim.o.copyindent = true
vim.o.expandtab = true
vim.o.shiftround = true
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.softtabstop = 2
vim.o.tabstop = 2


-- Copy paste
vim.api.nvim_set_keymap("n", "<c-c>", '"+yy', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<c-c>", '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<c-v>", '"+p', { noremap = true, silent = true })


-- Go to next <++> delete it and go into insert mode
vim.api.nvim_set_keymap("n", "<space>n", '/<++><CR>ca<', {})

-- Go to next <++?> and prompt to replace them all with input
vim.api.nvim_set_keymap("n", "<space>b", '/<++.><CR>va<y/<C-r>"<CR>:%s/<C-r>"//g<left><left>', {})


-- Disable unused providers
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
