
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

vim.g.coq_settings = {  auto_start = 'shut-up'  }
local coq = require "coq"
local servers = { 'tsserver', 'eslint' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup(coq.lsp_ensure_capabilities{
    on_attach = on_attach,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
  })
end

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

--
-- -- Setup nvim-cmp.
-- local cmp = require'camp'
--
-- cmp.setup({
-- 	-- snippet = {
-- 	-- 	-- REQUIRED - you must specify a snippet engine
-- 	-- 	expand = function(args)
-- 	-- 		vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
-- 	-- 		-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
-- 	-- 		-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
-- 	-- 		-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
-- 	-- 	end,
-- 	-- },
-- 	mapping = {
-- 		['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
-- 		['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
-- 		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
-- 		['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
-- 		['<C-e>'] = cmp.mapping({
-- 			i = cmp.mapping.abort(),
-- 			c = cmp.mapping.close(),
-- 		}),
-- 		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
-- 	},
-- 	sources = cmp.config.sources({
-- 		{ name = 'nvim_lsp' },
-- 		-- { name = 'vsnip' }, -- For vsnip users.
-- 		-- { name = 'luasnip' }, -- For luasnip users.
-- 		-- { name = 'ultisnips' }, -- For ultisnips users.
-- 		-- { name = 'snippy' }, -- For snippy users.
-- 	}, {
-- 		{ name = 'buffer' },
-- 	})
-- })
--
-- -- Set configuration for specific filetype.
-- -- cmp.setup.filetype('gitcommit', {
-- -- 	sources = cmp.config.sources({
-- -- 		{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it. 
-- -- 	}, {
-- -- 		{ name = 'buffer' },
-- -- 	})
-- -- })
--
-- -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
-- -- cmp.setup.cmdline('/', {
-- -- 	sources = {
-- -- 		{ name = 'buffer' }
-- -- 	}
-- -- })
--
-- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- -- cmp.setup.cmdline(':', {
-- -- 	sources = cmp.config.sources({
-- -- 		{ name = 'path' }
-- -- 	}, {
-- -- 		{ name = 'cmdline' }
-- -- 	})
-- -- })
--
-- -- Setup lspconfig.
-- -- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- -- require('lspconfig')['tsserver'].setup {
-- 	-- capabilities = capabilities
-- -- }
