
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
		    \ 'left': [ [ 'mode'],[ 'cocstatus','paste' ],
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
      \   'cocstatus': 'StatusDiagnostic'
      \ },
      \ }

function! LightlineFilename()
  return winwidth(0) > 60 ? @% : expand('%:t')
endfunction

function! LightlineBranchName()
  return winwidth(0) > 120 ? FugitiveHead() : ''
endfunction

" for custom lightline status (via coc.nvim)
function! StatusDiagnostic() abort
	  let info = get(b:, 'coc_diagnostic_info', {})
	  if empty(info) | return '' | endif
	  let msgs = []
	  " if get(info, 'error', 0)
	    call add(msgs, 'E' . info['error'])
	  " endif
	  " if get(info, 'warning', 0)
	    call add(msgs, 'W' . info['warning'])
	  " endif
    return join(msgs, ' ')
	endfunction

"backspace fix
:set backspace=start,indent,eol

"explorer
:map <leader>fe :Sexplore<cr>
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

" autocmd QuickFixCmdPost *grep* cwindow

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

map <leader>csl yss)Iconsole.log<esc>
map <leader>csc _v$hyPa: , <esc>hhv_S'yss)Iconsole.log<esc>
map <leader>css yss'yss)Iconsole.log<esc>

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

nmap <c-p> :FZF<cr>
nmap <leader>p :FZF<cr>
nmap <c-\> :call fzf#vim#buffers({'options': ['--layout=default', '--info=inline']})<cr>

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noruler noshowmode
  \| autocmd BufLeave <buffer> set laststatus=2 ruler
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* FindLiteral call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --glob "!package-lock.json" --glob "!build" --glob "!node_modules" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
command! -bang -nargs=* FindRegExp call fzf#vim#grep('rg --column --line-number --no-heading --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --glob "!package-lock.json" --glob "!build" --glob "!node_modules" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=* FindRegExpCaseSensitive call fzf#vim#grep('rg --column --line-number --no-heading --no-ignore --hidden --follow --glob "!.git/*" --glob "!package-lock.json" --glob "!build" --glob "!node_modules" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, fzf#vim#with_preview(), <bang>0)

let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(blue)%ae %C(green)%cr"'
let g:fzf_preview_window = ['right:40%', 'ctrl-h']

map <Plug>ExportConstFromClipboard o<c-r>0<esc>Iexport const <esc>A = '<c-r>0';<esc>
  \:call repeat#set("\<Plug>ExportConstFromClipboard", v:count)<cr>
map \fat <Plug>ExportConstFromClipboard

map \la :FindLiteral<Space>
map \a :FindRegExp<Space>
map \ca :FindRegExpCaseSensitive<Space>

map <Plug>NewLineAtSpace f cl<cr><esc>
  \:call repeat#set("\<Plug>NewLineAtSpace", v:count)<cr>
map \ts <Plug>NewLineAtSpace

" copy file name
map \cfn :let @0=expand('%:t')<cr>
map \ccfn :let @+=expand('%:t')<cr>
map \cccfn \cfni0Iconst A: React.FC<0Props> = () => {}O//joexport default 0ggwwyiwOinterface 0 {}O//
" copy file path
map \cfp :let @0=@%<cr>
map \ccfp :let @+=@%<cr>

map <Plug>CloneProps $vbyPa=<esc>lveS}athis.props.<esc>
            \:call repeat#set("\<Plug>CloneProps", v:count)<cr>
map <Plug>CloneState $vbyPa=<esc>lveS}athis.state.<esc>
            \:call repeat#set("\<Plug>CloneState", v:count)<cr>
map <Plug>CloneExact $vbyPa=<esc>lveS}
            \:call repeat#set("\<Plug>CloneExact", v:count)<cr>
map <Plug>CloneThis $vbyPa=<esc>lveS}athis.<esc>
            \:call repeat#set("\<Plug>CloneThis", v:count)<cr>
map \cp <Plug>CloneProps
map \cst <Plug>CloneState
map \ce <Plug>CloneExact
map \ct <Plug>CloneThis

map <silent>/<esc> :nohl<cr>
map <silent>/<tab> :nohl<cr>
map <silent>\$$ :e ~/.config/nvim/vimrc<cr>
map \$r :so ~/.config/nvim/vimrc<cr>
map \$R :so ~/.config/nvim/vimrc<cr>


map g<esc> :call v:lua.vim.lsp.util.buf_clear_references()<cr>

" Change CoLon to Comma
map <silent> <Plug>ChangeColonToComma V<Plug>VChangeColonToComma
  \:call repeat#set("\<Plug>ChangeColonToComma", v:count)<cr>
map <silent> \clc <Plug>ChangeColonToComma

" Change CoLon to Comma (visual)
vmap <silent> <Plug>VChangeColonToComma <esc>:set nohlsearch<cr>gv:s/:.*/,/<cr>:let @/=''<cr>:set hlsearch<cr>
  \:call repeat#set("\<Plug>VChangeColonToComma", v:count)<cr>
vmap <silent> \clc <Plug>VChangeColonToComma

" Delete after CoLon
map <silent> <Plug>ColonDelete V<Plug>VColonDelete
  \:call repeat#set("\<Plug>ColonDelete", v:count)<cr>
map <silent> \cld <Plug>ColonDelete

" Delete after CoLon (visual)
vmap <silent> <Plug>VColonDelete <esc>:set nohlsearch<cr>gv:s/:.*//<cr>:let @/=''<cr>:set hlsearch<cr>
  \:call repeat#set("\<Plug>VColonDelete", v:count)<cr>
vmap <silent> \cld <Plug>VColonDelete

" Change Tab to Colon. Useful when copying model from swagger
map <silent> <Plug>ChangeTabToColon V<Plug>VChangeTabToColon
  \:call repeat#set("\<Plug>ChangeTabToColon", v:count)<cr>
map <silent> \ctc <Plug>ChangeTabToColon

" Change Tab to Colon. (visual) Useful when copying model from swagger
vmap <silent> <Plug>VChangeTabToColon <esc>:set nohlsearch<cr>gv:s/	/:/<cr>:let @/=''<cr>:set hlsearch<cr>
  \:call repeat#set("\<Plug>VChangeTabToColon", v:count)<cr>
vmap <silent> \ctc <Plug>VChangeTabToColon

" Add try catch with set loading state to api call
map <silent> <Plug>AddTryCatchWithSetState VS{Itry $%A finally {}Othis.setState({loading: false})yykkPffcwtruej"0p
  \:call repeat#set("\<Plug>AddTryCatchWithSetState", v:count)<cr>
map <silent> \tc <Plug>AddTryCatchWithSetState

" provide interfaces to a class
map \cis _wye$bea<I0Props, I0State>kointerface I0Props {}interface I0State {}
map \ia oimport 0 from './0';


let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_def_mapping_enabled = 0
let $FZF_DEFAULT_COMMAND = 'rg --files'

" copy jira ticket number with braces during commit message, if branch name starts with ticket number
map <leader>cbn _4j3wy3e_gg$
map <leader>cbb _4j3wy3e:let @0='[0]'<cr>_gg$
map <silent> <leader><esc> :ccl<cr>
:autocmd FileType qf nnoremap <silent> <buffer> o <CR>:cclose<CR>

hi LspReferenceText guibg=#111111 ctermbg=100
hi LspReferenceRead guibg=#000000 ctermbg=100
hi LspReferenceWrite guibg=#FFFFFF ctermbg=100

autocmd BufNewFile,BufRead *.mdx set syntax=markdown.jsx

" TODO: better macro
nmap <silent>\ft :s/\(true\)\\|\(false\)/true<cr>
nmap <silent>\ff :s/\(true\)\\|\(false\)/false<cr>


" nnoremap n nzzzv
" nnoremap N Nzzzv
" nnoremap J mzJ`z
