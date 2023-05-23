
set noshowmode
let g:vim_jsx_pretty_colorful_config = 1

set t_ut=
" set termguicolors
" execute "set t_8f=\e[38;2;%lu;%lu;%lum"
" execute "set t_8b=\e[48;2;%lu;%lu;%lum"

set sw=2
set ts=2
" set et
set number
set relativenumber

set hlsearch

set scroll=5

set timeout timeoutlen=1000 ttimeoutlen=10

" this setting controls how long to wait (in ms) before fetching type / symbol information.
set updatetime=300

set laststatus=2
set encoding=utf-8

let g:gruvbox_italic=0
let g:gruvbox_termcolors=256
let g:gruvbox_contrast_dark='medium'
colorscheme gruvbox
set background=dark

set noswapfile

let g:lightline = {
    \ 'enable': {
		    \ 'statusline': 1,
		    \ 'tabline': 1
		    \ },
    \ 'colorscheme': 'gruvbox',
    \ 'active': {
		    \ 'left': [ [ 'mode'],['paste' ],
		    \           [ 'readonly', 'relativepath', 'modified' ] ],
		    \ 'right': [
		    \            [ 'gitbranch'],[ 'filetype' ] ] },
    \ 'inactive': {
		    \ 'left': [ [ 'filename', 'modified' ] ],
		    \ 'right': []
    \ },
      \ 'component_function': {
      \   'gitbranch': 'LightlineBranchName',
      \   'filename': 'LightlineFilename',
      \ },
      \ }

function! LightlineFilename()
  return winwidth(0) > 60 ? @% : expand('%:t')
endfunction

function! LightlineBranchName()
  return winwidth(0) > 120 ? FugitiveHead() : ''
endfunction

"backspace fix
:set backspace=start,indent,eol

"explorer
:map <leader>fe :Explore<cr>
let g:netrw_liststyle=3

" disable esc sound
set noeb vb t_vb=
au GUIEnter * set vb t_vb=

set incsearch
set scrolloff=1

let indent_guides_guide_size=1
let indent_guides_enable_on_vim_startup=0

autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4
autocmd FileType stylus setlocal shiftwidth=2 expandtab
autocmd FileType typescriptreact setlocal shiftwidth=2 noexpandtab
autocmd FileType typescript setlocal shiftwidth=2 noexpandtab

map <leader>gd :Gdiff<cr>
map <leader>gs :G<cr>

" Git blame
map <leader>gb :Git blame<cr>

"fzf.vim binding
map <leader>gc :Commits<cr>
map <leader>bc :BCommits<cr>

" close buffer
nnoremap tq :bd<cr>
" close buffer and flush
map <silent> TQ :bp<cr>:bd #<cr>
" delete trailing whitespaces
map <leader>dtw :%s/\s\+$//<cr>

" start CamelCasemotion
map <silent> W <Plug>CamelCaseMotion_w
map <silent> B <Plug>CamelCaseMotion_b
map <silent> E <Plug>CamelCaseMotion_e
map <silent> gE <Plug>CamelCaseMotion_ge
sunmap W
sunmap B
sunmap E
sunmap gE
" end CamelCaseMotion

let g:jsx_ext_required = 0
set showcmd

" console logs
map <Plug>ConSoleLog yss)Iconsole.log<esc>
  \:call repeat#set("\<Plug>ConSoleLog", v:count)<cr>
map <leader>csl <Plug>ConSoleLog

map <Plug>ConSolelogCopy _v$hyPa: , <esc>hhv_S'yss)Iconsole.log<esc>
  \:call repeat#set("\<Plug>ConSolelogCopy", v:count)<cr>
map <leader>csc <Plug>ConSolelogCopy

map <Plug>ConsoleLogString yss'yss)Iconsole.log<esc>
  \:call repeat#set("\<Plug>ConsoleLogString", v:count)<cr>
map <leader>css <Plug>ConsoleLogString


map <leader>fs :syntax sync fromstart<cr>
" cd to the current's file's directory
map <leader>wd :lcd %:p:h<cr>

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" Magic cursor switching?
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

set rtp+=/usr/local/opt/fzf
let g:fzf_colors =
\ { "fg":      ["fg", "Normal"],
  \ "bg":      ["bg", "Normal"],
  \ "hl":      ["fg", "IncSearch"],
  \ "fg+":     ["fg", "CursorLine", "CursorColumn", "Normal"],
  \ "bg+":     ["bg", "CursorLine", "CursorColumn"],
  \ "hl+":     ["fg", "IncSearch"],
  \ "info":    ["fg", "IncSearch"],
  \ "border":  ["fg", "Ignore"],
  \ "prompt":  ["fg", "Comment"],
  \ "pointer": ["fg", "IncSearch"],
  \ "marker":  ["fg", "IncSearch"],
  \ "spinner": ["fg", "IncSearch"],
  \ "header":  ["fg", "WildMenu"] }
let g:fzf_layout={'down':'40%'}


map <Plug>NewLineAtSpace f cl<cr><esc>
  \:call repeat#set("\<Plug>NewLineAtSpace", v:count)<cr>
map <leader>ts <Plug>NewLineAtSpace

" copy file name
map <leader>cfn :let @0=expand('%:t')<cr>
map <leader>ccfn :let @+=expand('%:t')<cr>
" copy file path
map <leader>cfp :let @0=@%<cr>
map <leader>ccfp :let @+=@%<cr>

" useful for component props
map <Plug>CloneProps $vbyPa=<esc>lveS}athis.props.<esc>
            \:call repeat#set("\<Plug>CloneProps", v:count)<cr>
map <Plug>CloneState $vbyPa=<esc>lveS}athis.state.<esc>
            \:call repeat#set("\<Plug>CloneState", v:count)<cr>
map <Plug>CloneExact $vbyPa=<esc>lveS}
            \:call repeat#set("\<Plug>CloneExact", v:count)<cr>
map <Plug>CloneThis $vbyPa=<esc>lveS}athis.<esc>
            \:call repeat#set("\<Plug>CloneThis", v:count)<cr>
map <leader>cp <Plug>CloneProps
map <leader>cst <Plug>CloneState
map <leader>ce <Plug>CloneExact
map <leader>ct <Plug>CloneThis

map <silent>/<esc> :nohl<cr>
map <silent>/<tab> :nohl<cr>
map <silent><leader>$$ :e ~/.config/nvim/vimrc<cr>
map <leader>$r :so ~/.config/nvim/vimrc<cr>
map <leader>$R :so ~/.config/nvim/vimrc<cr>


map <silent>g<esc> :call v:lua.vim.lsp.util.buf_clear_references()<cr>

" Change Equal (=) Delete
map <silent> <Plug>ChangeEqualDelete V<Plug>VChangeEqualDelete
  \:call repeat#set("\<Plug>ChangeEqualDelete", v:count)<cr>
map <silent> <leader>cwd <Plug>ChangeEqualDelete

" Change Equal (=) Delete (visual)
vmap <silent> <Plug>VChangeEqualDelete <esc>:set nohlsearch<cr>gv:s/=.*//<cr>:let @/=''<cr>:set hlsearch<cr>
  \:call repeat#set("\<Plug>VChangeEqualDelete", v:count)<cr>
vmap <silent> <leader>cwd <Plug>VChangeEqualDelete

" Change CoLon to Equal (=)
map <silent> <Plug>ChangeColonToEqual V<Plug>VChangeColonToEqual
  \:call repeat#set("\<Plug>ChangeColonToEqual", v:count)<cr>
map <silent> <leader>cle <Plug>ChangeColonToEqual

" Change CoLon to Equal (=) (visual)
vmap <silent> <Plug>VChangeColonToEqual <esc>:set nohlsearch<cr>gv:s/?\?:.*/=/<cr>:let @/=''<cr>:set hlsearch<cr>
  \:call repeat#set("\<Plug>VChangeColonToEqual", v:count)<cr>
vmap <silent> <leader>cle <Plug>VChangeColonToEqual

" Change CoLon to Equal (=) with braces
map <silent> <Plug>ChangeColonToEqualWithBraces V<Plug>VChangeColonToEqualWithBraces
  \:call repeat#set("\<Plug>ChangeColonToEqualWithBraces", v:count)<cr>
map <silent> <leader>clb <Plug>ChangeColonToEqualWithBraces

" Change CoLon to Equal (=) with braces (visual)
vmap <silent> <Plug>VChangeColonToEqualWithBraces <esc>:set nohlsearch<cr>gv:s/\(\w*\)\(?\?:.*\)/\1={\1}<cr>:let @/=''<cr>:set hlsearch<cr>
  \:call repeat#set("\<Plug>VChangeColonToEqualWithBraces", v:count)<cr>
vmap <silent> <leader>clb <Plug>VChangeColonToEqualWithBraces

" Change CoLon to Comma
map <silent> <Plug>ChangeColonToComma V<Plug>VChangeColonToComma
  \:call repeat#set("\<Plug>ChangeColonToComma", v:count)<cr>
map <silent> <leader>clc <Plug>ChangeColonToComma

" Change CoLon to Comma (visual)
vmap <silent> <Plug>VChangeColonToComma <esc>:set nohlsearch<cr>gv:s/?\?:.*/,/<cr>:let @/=''<cr>:set hlsearch<cr>
  \:call repeat#set("\<Plug>VChangeColonToComma", v:count)<cr>
vmap <silent> <leader>clc <Plug>VChangeColonToComma

" Delete after CoLon
map <silent> <Plug>ColonDelete V<Plug>VColonDelete
  \:call repeat#set("\<Plug>ColonDelete", v:count)<cr>
map <silent> <leader>cld <Plug>ColonDelete

" Delete after CoLon (visual)
vmap <silent> <Plug>VColonDelete <esc>:set nohlsearch<cr>gv:s/?\?:.*//<cr>:let @/=''<cr>:set hlsearch<cr>
  \:call repeat#set("\<Plug>VColonDelete", v:count)<cr>
vmap <silent> <leader>cld <Plug>VColonDelete

" Delete after CoLon retain colon
map <silent> <Plug>ColonDelete V<Plug>VColonDelete
  \:call repeat#set("\<Plug>ColonDelete", v:count)<cr>
map <silent> <leader>clsd <Plug>ColonDelete

" Delete after CoLon retain colon (visual)
vmap <silent> <Plug>VColonDelete <esc>:set nohlsearch<cr>gv:s/?\?:.*/:/<cr>:let @/=''<cr>:set hlsearch<cr>
  \:call repeat#set("\<Plug>VColonDelete", v:count)<cr>
vmap <silent> <leader>clsd <Plug>VColonDelete

" Change Tab to Colon. Useful when copying model from swagger
map <silent> <Plug>ChangeTabToColon V<Plug>VChangeTabToColon
  \:call repeat#set("\<Plug>ChangeTabToColon", v:count)<cr>
map <silent> <leader>ctc <Plug>ChangeTabToColon

" Change Tab to Colon. (visual) Useful when copying model from swagger
vmap <silent> <Plug>VChangeTabToColon <esc>:set nohlsearch<cr>gv:s/	/:/<cr>:let @/=''<cr>:set hlsearch<cr>
  \:call repeat#set("\<Plug>VChangeTabToColon", v:count)<cr>
vmap <silent> <leader>ctc <Plug>VChangeTabToColon

" Add try catch with set loading state to api call
map <silent> <Plug>AddTryCatchWithSetState VS{Itry $%A finally {}Othis.setState({loading: false})yykkPffcwtruej"0p
  \:call repeat#set("\<Plug>AddTryCatchWithSetState", v:count)<cr>
map <silent> <leader>tc <Plug>AddTryCatchWithSetState

map <leader>ia oimport 0 from './0';

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_def_mapping_enabled = 0

map <silent> <leader><esc> :ccl<cr>
:autocmd FileType qf nnoremap <silent> <buffer> o <CR>:cclose<CR>

hi LspReferenceText guibg=#111111 ctermbg=100
hi LspReferenceRead guibg=#000000 ctermbg=100
hi LspReferenceWrite guibg=#FFFFFF ctermbg=100

autocmd BufNewFile,BufRead *.mdx set syntax=markdown.jsx

" TODO: better macro
nmap <silent><leader>ft :s/\(true\)\\|\(false\)/true<cr>:nohl<cr>
nmap <silent><leader>ff :s/\(true\)\\|\(false\)/false<cr>:nohl<cr>

" for lsp_definitions to behave well with react
nmap go g#ggNgd

set mouse=r
