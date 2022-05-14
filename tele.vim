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
			 -- preview_cutoff = 9999999,
			},
		 scroll_speed = 2
		},
		mappings = {
			i = {
				["<C-h>"] = action_layout.toggle_preview,
				["<esc>"] = actions.close,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			}
		}
	},
	-- defaults = {},
	pickers = {
	find_files = {
		-- theme = "ivy",
		},
	},
	-- extensions = {},
}
require('telescope').load_extension('fzf')

mapWTheme('n', '<c-\\>', 'buffers', "sort_mru = true, ignore_current_buffer = true" )
mapWTheme('n', '\\ta', 'live_grep')
mapWTheme('n', 'gd', 'lsp_definitions')
mapWTheme('n', 'gr', 'lsp_references')
EOF


nmap <c-p> <cmd>Telescope find_files<cr>
nmap :: <cmd>Telescope command_history<cr>

nnoremap gf :lua require'telescope.builtin'.lsp_code_actions(require('telescope.themes').get_cursor({}))<cr>
vnoremap gf :lua require'telescope.builtin'.lsp_range_code_actions(require('telescope.themes').get_cursor({}))<cr>
