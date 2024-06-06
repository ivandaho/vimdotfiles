lua << EOF
local defaultTheme = 'get_ivy'
local opts = { noremap=true, silent=true }
local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")

local mapWTheme = function(mode, lhs, teleFn, fnOpts)
	fnOpts = fnOpts or '' vim.api.nvim_set_keymap(mode, lhs,  "<cmd>lua require'telescope.builtin'." .. teleFn .. "(require('telescope.themes')." .. defaultTheme .. "({ " .. fnOpts .. " }))<cr>", opts)
end

require('telescope').setup{
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
		}
	},
	-- defaults = {},
	pickers = {
	find_files = {
		-- theme = "ivy",
		},
	},
	extensions = {
		["ui-select"] = {
      require("telescope.themes").get_cursor {
      }
    },
		fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
	},
}
require('telescope').load_extension('fzf')
require("telescope").load_extension("ui-select")

mapWTheme('n', '<c-\\>', 'buffers', "sort_mru = true, ignore_current_buffer = true" )
mapWTheme('n', '<leader>ta', 'live_grep')
mapWTheme('n', 'gd', 'lsp_definitions', "fname_width = 120, show_line = false")
mapWTheme('n', 'gr', 'lsp_references', "fname_width = 250, show_line = false")
--  -- mapWTheme('n', '<leader>gc', 'git_commits')
--  mapWTheme('n', '<leader>bc', 'git_bcommits')
-- 
-- 
--  local builtin = require("telescope.builtin")
-- 
--  my_git_commits = function()
--    local opts = {}
--    opts.git_command = {"git", "log", "--pretty=format:%C(#8ec07c)%h%<(20,trunc) %C(#b8bb26 bold)%an %C(#928374 no-bold)%as %C(#d3869b)%s"}
--  	builtin.git_commits(opts)
--  end
-- 
-- 
--  -- vim.api.nvim_set_keymap("n", "<leader>gc", "<cmd>lua my_git_commits()<cr>", opts)
-- 
EOF


nmap <c-p> <cmd>Telescope find_files<cr>
nmap :: <cmd>Telescope command_history<cr>

nnoremap <silent> gf :call v:lua.vim.lsp.buf.code_action()<cr>
