-- Required packages
-- nvim-packer-git
-- vim-airline
-- vim-gitgutter
-- clang
-- rust-analyzer
-- omnisharp-roslyn
-- pyright
-- bash-language-server
-- cmake-language-server
-- haskell-language-server

local use = require('packer').use;

require('packer').startup(function()
  use 'tpope/vim-fugitive' -- Git commands in nvim
  use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
  -- Add git related info in the signs columns and popups
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
  -- UI to select things (files, grep results, open buffers...)
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'ray-x/lsp_signature.nvim' -- Signature help typing
   -- Highlight, edit, and navigate code using a fast incremental parsing library
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  -- Additional textobjects for treesitter
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  -- Context for stuff
  use 'nvim-treesitter/nvim-treesitter-context'
end)

-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require('nvim-treesitter.configs').setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true, -- false will disable the whole extension
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

local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  require("lsp_signature").on_attach()

end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver', 'texlab', 'bashls', 'cmake', 'cssls', 'eslint', 'html', 'jsonls', 'hls' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

nvim_lsp.omnisharp.setup {
    cmd = { "omnisharp", "--languageserver" , "--hostPID", tostring(pid) },
    on_attach = on_attach,
    capabilities = capabilities,
}

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- luasnip setup
local luasnip = require('luasnip')

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

-- Telescope
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}
--Add leader shortcuts
vim.api.nvim_set_keymap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sf', [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sg', [[<cmd>lua require('telescope.builtin').git_files()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>st', [[<cmd>lua require('telescope.builtin').tags()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sp', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>so', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], { noremap = true, silent = true })

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



-- Use powerline fonts
vim.g.airline_powerline_fonts = 1

-- Copy paste
vim.api.nvim_set_keymap("n", "<c-c>", '"+yy', {noremap=true, silent=true})
vim.api.nvim_set_keymap("v", "<c-c>", '"+y', {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<c-v>", '"+p', {noremap=true, silent=true})


-- Go to next <++> delete it and go into insert mode
vim.api.nvim_set_keymap("n", "<space>n", '/<++><CR>ca<', {})

-- Go to next <++?> and prompt to replace them all with input
vim.api.nvim_set_keymap("n", "<space>b", '/<++.><CR>va<y/<C-r>"<CR>:%s/<C-r>"//g<left><left>', {})


-- Latex code snippets
local function latex_binding(suffix, vimCommand, mode)
  vim.api.nvim_set_keymap(mode or "n", "<space>l" .. suffix, vimCommand, {})
end

local function latex_command(suffix, command, insertOp)
  latex_binding(suffix, (insertOp or 'o') .. '\\' .. command .. '{}<left>')
end

local function latex_wrap(suffix, command)
  latex_binding(suffix, 'c' .. '\\' .. command .. '{<c-r>"}<esc>', "v")
end

local function latex_command_and_wrap(suffix, command)
  latex_command(suffix, command, "a")
  latex_wrap(suffix, command)
end

local function latex_environment(suffix, env)
  latex_binding(suffix, 'o\\begin{' .. env .. '}<CR><CR>\\end{' .. env .. '}<CR><up><up><tab>')
end

-- Compile with latexmk
latex_binding("m", ':!latexmk<CR>')

-- Text modifiers
latex_command_and_wrap("tb", "textbf", "a")
latex_command_and_wrap("ti", "textit", "a")
latex_command_and_wrap("tt", "texttt", "a")
latex_command_and_wrap("ts", "say", "a")

-- Sections
latex_command("ch", "chapter")
latex_command("se", "section")
latex_command("ss", "subsection")
latex_command("sS", "subsubsection")
latex_command("sp", "paragraph")
latex_command("sP", "subparagraph")

-- Lists
latex_environment("li", "itemize")
latex_environment("le", "enumerate")
latex_environment("ld", "description")

-- Math
latex_environment("eq", "equation")
latex_binding("es", 'o\\begin{equation}<CR>\\begin{aligned}<CR><CR>\\end{aligned}<CR>\\end{equation}<CR><ESC>4kV3j<ji<tab>')
latex_environment("et", "theorem")
latex_environment("ep", "proof")

-- Figure
latex_binding("fg", 'o\\begin{figure}[H]<CR>\\centering<CR>\\includegraphics[width=\\textwidth]{<++>}<CR>\\caption{<++>}<CR>\\label{fig:<++>}<CR>\\end{figure}<CR><ESC>4k0')
latex_binding("fn", 'o\\begin{figure}[H]<CR>\\centering<CR><++><CR>\\caption{<++>}<CR>\\label{fig:<++>}<CR>\\end{figure}<CR><ESC>4k0')



--[[
" Sections
nmap <space>lch o\chapter{<++>}<CR><ESC>k0
nmap <space>lse o\section{<++>}<CR><ESC>k0
nmap <space>lss o\subsection{<++>}<CR><ESC>k0
nmap <space>lsS o\subsubsection{<++>}<CR><ESC>k0
nmap <space>lsp o\paragraph{<++>}<CR><ESC>k0
nmap <space>lsP o\subparagraph{<++>}<CR><ESC>k0

" Math
nmap <space>leq o\begin{equation}<CR><++><CR>\end{equation}<CR><ESC>2k0
nmap <space>les o\begin{equation}<CR>\begin{aligned}<CR><++><CR>\end{aligned}<CR>\end{equation}<CR><ESC>3k0
nmap <space>let o\begin{theorem}<CR><++><CR>\end{theorem}<CR><ESC>2k0
nmap <space>lep o\begin{proof}<CR><++><CR>\end{proof}<CR><ESC>2k0

" Figure
nmap <space>lfg o\begin{figure}[H]<CR>\centering<CR>\includegraphics[width=\textwidth]{<++>}<CR>\caption{<++>}<CR>\label{fig:<++>}<CR>\end{figure}<CR><ESC>4k0
nmap <space>lfn o\begin{figure}[H]<CR>\centering<CR><++><CR>\caption{<++>}<CR>\label{fig:<++>}<CR>\end{figure}<CR><ESC>4k0

" Listings
nmap <space>llc o\begin{listing}[H]<CR>\begin{minted}[breaklines, linenos]{<++>}<CR><++><CR>\end{minted}<CR>\caption{<++>}<CR>\label{lst:<++>}<CR>\end{listing}<CR><ESC>6k0Vj:s/^  //<CR>:noh<CR>k
nmap <space>lli o\begin{listing}[H]<CR>\inputminted[breaklines, linenos, firstline=<++>, lastline=<++>]{<++>}{<++>}<CR>\caption{<++>}<CR>\label{lst:<++>}<CR>\end{listing}<CR><ESC>4k0
--]]
