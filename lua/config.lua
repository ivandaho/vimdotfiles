local opts = { noremap = true, silent = true }
local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gh', '<cmd>lua vim.lsp.buf.hover({border = "rounded"})<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gw', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<c-j>', '<cmd>lua vim.diagnostic.jump({count=1})<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<c-k>', '<cmd>lua vim.diagnostic.jump({count=-1})<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gj', '<cmd>lua vim.diagnostic.open_float({border = "rounded"})<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gm', '<cmd>call Black()<CR>', opts)
  -- if client == 'gopls' then
  -- 	vim.api.nvim_buf_set_keymap(bufnr, 'n', '\\q',    ':GoFmt<CR>', {})
  -- end

  vim.api.nvim_exec(
    [[
		function! Highlight()
			call v:lua.vim.lsp.buf.document_highlight()
			call v:lua.vim.lsp.util.buf_clear_references()

		endfunction

		autocmd CursorHold * call Highlight()
	]], false)
  -- vim.api.nvim_set_hl(0,
end

local servers = { 'ts_ls', 'eslint', 'gopls', 'pyright', 'sourcekit', 'vue_ls' }
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
for _, lsp in pairs(servers) do
  vim.lsp.config(lsp, {
    on_attach = on_attach,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    },
    capabilities = capabilities
  })
  vim.lsp.enable(lsp)
end

vim.lsp.config('lua_ls', {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = {
          "vim"
        }
      }
    }
  }
})

vim.lsp.enable('lua_ls')


-- local prettier = require("prettier")

-- prettier.setup({
--   bin = 'prettier', -- or `prettierd`
--   filetypes = {
--     "css",
--     "graphql",
--     "html",
--     "javascript",
--     "javascriptreact",
--     "json",
--     "less",
--     "markdown",
--     "scss",
--     "typescript",
--     "typescriptreact",
--     "yaml",
--   },
-- })

vim.api.nvim_set_keymap('n', '<Leader>q', ':Neoformat<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>es', ':EslintFixAll<CR>', opts)
vim.api.nvim_set_keymap('i', 'fnfn', '() => {}i<enter>O', opts)
vim.api.nvim_set_keymap('i', 'fncn', '() => ({})hi<enter>O', opts)
vim.api.nvim_set_keymap('i', 'ueff', 'useEffect(() => {}i<enter>Oja, []);kcc', opts)
vim.api.nvim_set_keymap('i', 'cncn', 'className=""i', opts)
vim.api.nvim_set_keymap('i', 'fnfl', '() => {}i<enter>Oja', opts)
vim.api.nvim_set_keymap('i', 'fncl', '() => ({})hi<enter>Oja', opts)

require 'nvim-treesitter'.install {
    "bash",
    "css",
    "dockerfile",
    "fish",
    "go",
    "graphql",
    "html",
    "http",
    "java",
    "javascript",
    "jsdoc",
    "json",
    "json5",
    "lua",
    "make",
    "markdown",
    "pug",
    "python",
    "ql",
    "regex",
    "scss",
    "tsx",
    "typescript",
    "vim",
    "vue",
    "yaml",
    "terraform",
    "lua"
}


-- Setup nvim-cmp.
local cmp = require 'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.abort(),

    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    -- { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    {
      name = 'buffer',
      option = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end
      }
    },
  }),
  confirmation = {
    get_commit_characters = function(commit_characters)
      return {}
    end
  }
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Default options:
require("gruvbox").setup({
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "",  -- can be "hard", "soft" or empty string
  palette_overrides = {},
  -- overrides = {
  -- 	["LspReferenceRead"] = { bg = "#458599" },
  -- 	["LspReferenceText"] = { bg = "#ebdbb2" },
  -- 	["LspReferenceWrite"] = { bg = "#ff0000" },
  -- },
  dim_inactive = false,
  transparent_mode = false,
})
vim.cmd("colorscheme gruvbox")

-- In fugitive Git window, map 'cl' to start commit with message
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'fugitive',
  callback = function()
    vim.keymap.set('n', 'cl', ":Git commit -m ''<Left>", { buffer = true })
  end,
})
