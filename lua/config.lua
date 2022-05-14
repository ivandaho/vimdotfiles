
local opts = { noremap=true, silent=true }
local on_attach = function(client, bufnr)

	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)

  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gw', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<c-j>', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<c-k>', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gj',    '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
	-- if client == 'gopls' then
	-- 	vim.api.nvim_buf_set_keymap(bufnr, 'n', '\\q',    ':GoFmt<CR>', {})
	-- end
			
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gf', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)


	vim.api.nvim_exec(
	[[
		function! Highlight()
			call v:lua.vim.lsp.buf.document_highlight()
			call v:lua.vim.lsp.util.buf_clear_references()

		endfunction

		autocmd CursorHold * call Highlight()
	]], false)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gw', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

local nvim_lsp = require'lspconfig'

local servers = { 'tsserver', 'eslint', 'gopls' }
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
for _, lsp in pairs(servers) do
	require('lspconfig')[lsp].setup{
		on_attach = on_attach,
		flags = {
			-- This will be the default in neovim 0.7+
			debounce_text_changes = 150,
		},
    capabilities = capabilities
	}
end


nvim_lsp.golangci_lint_ls.setup{
	on_attach = on_attach,
	flags = {
		-- This will be the default in neovim 0.7+
		debounce_text_changes = 150,
	},
	filetypes = {'go'},
	cmd = {'/Users/ivanho/go/bin/golangci-lint-langserver'},
	init_options = {
		command = { "golangci-lint", "run", "--enable-all", "--disable", "lll", "--out-format", "json" };
	},
	capabilities = capabilities
}

local null_ls = require("null-ls")
local prettier = require("prettier")

-- null_ls.setup({
-- 	sources = {
-- 		require("null-ls").builtins.formatting.stylua,
-- 		require("null-ls").builtins.diagnostics.eslint,
-- 		require("null-ls").builtins.completion.spell,
-- 	},
--   on_attach = function(client, bufnr)
--     if client.resolved_capabilities.document_formatting then
--       vim.cmd("nnoremap <silent><buffer> <Leader>q :lua vim.lsp.buf.formatting()<CR>")
--       -- format on save
--       -- vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
--     end
--
--     if client.resolved_capabilities.document_range_formatting then
--       vim.cmd("xnoremap <silent><buffer> <Leader>q :lua vim.lsp.buf.range_formatting({})<CR>")
--     end
--   end,
-- })

prettier.setup({
  bin = 'prettier', -- or `prettierd`
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },
})

vim.api.nvim_set_keymap('n', '<Leader>q', ':Prettier<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>es', ':EslintFixAll<CR>', opts)

require'nvim-treesitter.configs'.setup {
-- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = {
		"bash",
		"css",
		"dockerfile",
		"fish",
		"go",
		"gomod",
		"gowork",
		"graphql",
		"html",
		"http",
		"java",
		"javascript",
		"jsdoc",
		"json",
		"json5",
		"jsonc",
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
	},
  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  -- ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}


-- Setup nvim-cmp.
local cmp = require'cmp'

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
		['<C-Space>'] = cmp.mapping.complete(),
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
		{ name = 'buffer' },
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

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})
