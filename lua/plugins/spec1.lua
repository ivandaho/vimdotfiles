return {
  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme gruvbox]])
    end,
  },
  { 'justinmk/vim-sneak', },
  {
    'bkad/CamelCaseMotion',
    config = function()
      vim.cmd([[map <silent> W <Plug>CamelCaseMotion_w]])
      vim.cmd([[map <silent> B <Plug>CamelCaseMotion_b]])
      vim.cmd([[map <silent> E <Plug>CamelCaseMotion_e]])
      vim.cmd([[map <silent> gE <Plug>CamelCaseMotion_ge]])
      vim.cmd([[omap <silent> iW <Plug>CamelCaseMotion_iw]])
      vim.cmd([[xmap <silent> iW <Plug>CamelCaseMotion_iw]])
      -- vim.cmd([[omap <silent> iB <Plug>CamelCaseMotion_ib]])
      -- vim.cmd([[xmap <silent> iB <Plug>CamelCaseMotion_ib]])
      -- vim.cmd([[omap <silent> iE <Plug>CamelCaseMotion_ie]])
      -- vim.cmd([[xmap <silent> iE <Plug>CamelCaseMotion_ie]])
    end,
  },
  {
    'airblade/vim-gitgutter',
    -- gitgutter signs configured in init.lua
  },
  { 'tomtom/tcomment_vim', },
  { 'chrisbra/csv.vim', },
  { 'tpope/vim-eunuch', },
  {
    'tpope/vim-fugitive',
    config = function()
      vim.cmd([[map <silent><leader>gs :G<CR>]])
      vim.cmd([[map <silent><leader>gd :Gdiff<CR>]])
      vim.cmd([[map <silent><leader>gb :Git blame<CR>]])

      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'fugitive',
        callback = function()
          vim.keymap.set('n', 'cl', ":Git commit -m ''<Left>", { buffer = true })
        end,
      })
    end,
  },
  { 'tpope/vim-repeat', },
  { 'tpope/vim-surround', },
  { 'tpope/vim-speeddating', },
  {
    'sbdchd/neoformat',
    config = function()
      vim.cmd([[map <silent><leader>q :Neoformat<CR>]])
      vim.cmd([[let g:neoformat_try_node_exe = 1]])
      vim.cmd("let g:neoformat_enabled_typescriptreact = ['eslint_d', 'prettier']")
      vim.cmd("let g:neoformat_enabled_typescript = ['eslint_d', 'prettier']")
      vim.cmd("let g:neoformat_enabled_python = ['ruff']")
      vim.cmd("let g:neoformat_run_all_formatters = 1")
    end,
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local opts = { noremap = true, silent = true }
      local on_attach = function(client, bufnr)
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gw', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<c-j>', '<cmd>lua vim.diagnostic.jump({count=1, float = true})<CR>',
          opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<c-k>', '<cmd>lua vim.diagnostic.jump({count=-1, float = true})<CR>',
          opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gj', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)

        vim.api.nvim_exec(
          [[
		function! Highlight()
			call v:lua.vim.lsp.buf.document_highlight()
			call v:lua.vim.lsp.util.buf_clear_references()

		endfunction

		autocmd CursorHold * call Highlight()
	]], false)
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
      end

      local servers = { 'ts_ls', 'eslint', 'gopls', 'basedpyright', 'sourcekit', 'vue_ls' }
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

      vim.api.nvim_set_keymap('i', 'fnfn', '() => {}i<enter>O', opts)
      vim.api.nvim_set_keymap('i', 'fncn', '() => ({})hi<enter>O', opts)
      vim.api.nvim_set_keymap('i', 'ueff', 'useEffect(() => {}i<enter>Oja, []);kcc', opts)
      vim.api.nvim_set_keymap('i', 'cncn', 'className=""i', opts)
      vim.api.nvim_set_keymap('i', 'fnfl', '() => {}i<enter>Oja', opts)
      vim.api.nvim_set_keymap('i', 'fncl', '() => ({})hi<enter>Oja', opts)
    end,
  },
  {
    'hrsh7th/nvim-cmp',
    config = function()
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
    end,
  },
  { 'hrsh7th/cmp-nvim-lsp', },
  { 'hrsh7th/cmp-buffer', },
  {
    'itchyny/lightline.vim',
    config = function()
      vim.g.lightline = {
        enable = {
          statusline = 1,
          tabline = 1
        },
        colorscheme = 'seoul256',
        active = {
          left = { { 'mode' }, { 'paste' },
            { 'readonly', 'relativepath', 'modified' } },
          right = { { 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_hints', 'linter_ok' }, { 'gitbranch' }, { 'filetype' } }
        },
        inactive = {
          left = { { 'filename', 'modified' } },
          right = {}
        },
        -- component_function = {
        --   gitbranch = 'LightlineBranchName',
        --   filename = 'LightlineFilename',
        -- },
        component_expand = {
          linter_hints = 'lightline#lsp#hints',
          linter_infos = 'lightline#lsp#infos',
          linter_warnings = 'lightline#lsp#warnings',
          linter_errors = 'lightline#lsp#errors',
          linter_ok = 'lightline#lsp#ok',
        },
        component_type = {
          linter_hints = 'right',
          linter_infos = 'right',
          linter_warnings = 'warning',
          linter_errors = 'error',
          linter_ok = 'right',
        },
      }

      -- TODO: use these
      -- function! LightlineFilename()
      --   return winwidth(0) > 60 ? @% : expand('%:t')
      -- endfunction
      --
      -- function! LightlineBranchName()
      --   return winwidth(0) > 120 ? FugitiveHead() : ''
      -- endfunction
    end,
  },
  {
    'spywhere/lightline-lsp',
    config = function()
      vim.cmd([[let g:lightline#lsp#indicator_hints = "\uf002 "]])
      vim.cmd([[let g:lightline#lsp#indicator_infos = "\uf129 "]])
      vim.cmd([[let g:lightline#lsp#indicator_warnings = "\uf071 "]])
      vim.cmd([[let g:lightline#lsp#indicator_errors = "\uf05e "]])
      vim.cmd([[let g:lightline#lsp#indicator_ok = "\uf00c"]])
    end

  },
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
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
    end
  },
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- optional but recommended
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      { 'nvim-telescope/telescope-ui-select.nvim' },
    },
    config = function()
      local defaultTheme = 'get_ivy'
      local opts = { noremap = true, silent = true }
      local actions = require("telescope.actions")
      local action_layout = require("telescope.actions.layout")

      local mapWTheme = function(mode, lhs, teleFn, fnOpts)
        fnOpts = fnOpts or ''
        vim.api.nvim_set_keymap(mode, lhs,
          "<cmd>lua require'telescope.builtin'." ..
          teleFn .. "(require('telescope.themes')." .. defaultTheme .. "({ " .. fnOpts .. " }))<cr>", opts)
      end

      require('telescope').setup {
        defaults = {
          scroll_strategy = "limit",
          -- path_display = [["truncate"]],
          layout_config = {
            horizontal = {
              width = 0.999,
              height = 0.5,
              anchor = "S",
              preview_cutoff = 20,
            },
            scroll_speed = 2
          },
          mappings = {
            i = {
              ["<C-h>"] = action_layout.toggle_preview,
              ["<esc>"] = actions.close,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-s>"] = actions.cycle_previewers_next,
              ["<C-a>"] = actions.cycle_previewers_prev,
            }
          },
          preview = {
            hide_on_startup = true,
          }
        },
        -- defaults = {},
        pickers = {
          find_files = {
            -- theme = "ivy",
          },
          live_grep = {
            file_ignore_patterns = { 'node_modules', '.git', 'env' },
            theme = "ivy",
            additional_args = function(_)
              return { "--hidden" }
            end
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_cursor {
            }
          },
          fzf = {
            fuzzy = true,             -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          }
        },
      }
      require('telescope').load_extension('fzf')
      require("telescope").load_extension("ui-select")

      mapWTheme('n', '<c-p>', 'find_files', "hidden = true, file_ignore_patterns = {'.git'}")
      mapWTheme('n', '<c-\\>', 'buffers', "sort_mru = true, ignore_current_buffer = true")
      mapWTheme('n', 'gd', 'lsp_definitions', "fname_width = 120, show_line = false")
      mapWTheme('n', 'gr', 'lsp_references', "fname_width = 250, show_line = false")

      vim.cmd([[nmap <leader>ta <cmd>Telescope live_grep<cr>]])
      vim.cmd([[nmap :: <cmd>Telescope command_history<cr>]])

      -- TODO: revisit
      -- local builtin = require("telescope.builtin")
      --
      -- my_git_commits = function()
      --   local opts = {}
      --   opts.git_command = { "git", "log",
      --     "--pretty=format:%C(#8ec07c)%h%<(20,trunc) %C(#b8bb26 bold)%an %C(#928374 no-bold)%as %C(#d3869b)%s" }
      --   builtin.git_commits(opts)
      -- end
      --
      -- vim.api.nvim_set_keymap("n", "<leader>gc", "<cmd>lua my_git_commits()<cr>", opts)
    end
  },
  {
    'junegunn/fzf',
    build = "./install --all",
  },
  {
    'junegunn/fzf.vim',
    lazy = false,
    config = function()
      vim.g.fzf_vim = {}
      vim.g.fzf_vim.commits_log_options =
      '--graph --color=always --format="%C(#8ec07c)%h%<(20,trunc) %C(#b8bb26 bold)%an %C(#928374 no-bold)%as %C(#d3869b)%s"'
      vim.g.fzf_colors =
      {
        ["fg"] = { "fg", "Normal" },
        ["bg"] = { "bg", "Normal" },
        ["bg+"] = { "bg", "CursorLine", "CursorColumn" },
        ["hl+"] = { "fg", "IncSearch" },
        ["info"] = { "fg", "IncSearch" },
        ["border"] = { "fg", "Ignore" },
        ["prompt"] = { "fg", "Comment" },
        ["pointer"] = { "fg", "IncSearch" },
        ["marker"] = { "fg", "IncSearch" },
        ["spinner"] = { "fg", "IncSearch" },
        ["header"] = { "fg", "WildMenu" }
      }
      vim.g.fzf_layout = { down = '40%' }

      vim.cmd([[map <leader>gc :Commits<cr>]])
      vim.cmd([[map <leader>bc :BCommits<cr>]])
    end
  }
}
