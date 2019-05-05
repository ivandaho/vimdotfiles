" disable pathogen
" lang en_us
" let g:pathogen_disabled = ["omnisharp-vim,supertab"]
" let g:ycm_server_python_interpreter = "/usr/bin/python"
" execute pathogen#infect()

call plug#begin('~/.vim/bundle')
" Plug 'HerringtonDarkholme/yats.vim', {'do' : 'make'}
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'airblade/vim-gitgutter'
Plug 'bkad/CamelCaseMotion'
Plug 'ervandew/supertab'
Plug 'groenewege/vim-less'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'morhetz/gruvbox'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'tomtom/tcomment_vim'
Plug 'chrisbra/csv.vim'
" Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
call plug#end()

set noshowmode
let g:vim_jsx_pretty_colorful_config = 1

" call deoplete#enable()
" let g:deoplete#complete_method='omnifunc'
" let g:deoplete#enable_smart_case=1
" let g:deoplete#omni#input_patterns = {}
" let g:deoplete#omni#input_patterns.javascript = '[^. *\t]\.\w*'

set t_ut=
" set termguicolors
" execute "set t_8f=\e[38;2;%lu;%lu;%lum"
" execute "set t_8b=\e[48;2;%lu;%lu;%lum"

set sw=2
set ts=2
set et
set number

set hlsearch

set scroll=5

set timeout timeoutlen=1000 ttimeoutlen=10


" delete highlights from search etc
map <silent> fdh :nohl<CR>

" this setting controls how long to wait (in ms) before fetching type / symbol information.
set updatetime=500

set laststatus=2
set encoding=utf-8

" OSX
" set guifont=Fira\ Code
" set guifont=Menlo\ For\ Powerline

" windows
" size 9 is better for 125% hdpi scaling
" set guifont=DejaVu_Sans_Mono_for_Powerline:h9:cANSI
"

let g:gruvbox_italic=0
let g:gruvbox_termcolors=256
let g:gruvbox_contrast_dark='medium'
colorscheme gruvbox
set background=dark
let g:lightline = {
    \ 'enable': {
		    \ 'statusline': 1,
		    \ 'tabline': 1
		    \ },
    \ 'colorscheme': 'gruvbox',
    \ 'active': {
		    \ 'left': [ [ 'mode', 'paste' ],
		    \           [ 'readonly', 'relativepath', 'modified' ] ],
		    \ 'right': [
		    \            [ 'filetype' ] ] },
    \ 'inactive': {
		    \ 'left': [ [ 'filename', 'modified' ] ],
		    \ 'right': []
    \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ },
      \ }
function! LightlineFilename()
  return winwidth(0) > 60 ? @% : expand('%:t')
endfunction


"backspace fix
:set backspace=start,indent,eol

"explorer
:map \fe :Sexplore<cr>
let g:netrw_liststyle=3

" disable esc sound
set noeb vb t_vb=
au GUIEnter * set vb t_vb=

set incsearch
set scrolloff=1

let indent_guides_guide_size=1
let indent_guides_enable_on_vim_startup=1

autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4

map \gd :Gdiff<cr>
map \gs :Gstatus<cr>
map \gp :Git push<cr>
map \gb :Gblame<cr>

"fzf.vim binding
map \gc :Commits<cr>

autocmd QuickFixCmdPost *grep* cwindow

" close buffer
nnoremap tq :bd<cr>
" close buffer and flush
map <silent> TQ :bp<cr>:bd #<cr>
" delete trailing whitespaces
map fdtw :%s/\s\+$//<cr>

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

" blaze to react change stuff
map <leader>chc :%s/<!--/\{\/*/<cr>:%s/-->/*\/\}<cr>
map <leader>cn :%s/class=/className=/g<cr>
map <leader>cb :%s/<br>/<br\/>/g<cr>
map <leader>cl :%s/<Link to/<Link to/g<cr>:%s/<\/a>/<\/Link>/g<cr>;
map <leader>cdb :%s/{{//g<cr>:%s/}}//g<cr>

map <leader>cdm ocomponentDidMount() {<cr>}<esc>O

" react helpers
map \rc oclass Component extends React.Component {<cr>render() {<cr>return (<cr>)<cr>}<cr>}<esc>%_w
map \rp oconstructor(props) {<cr>super(props);<cr>}<esc>kw
map \rf _cwfunction<Esc>elct{(props) <Esc>jd3jk$%ddv$=
map \rb _ye/super(<cr>othis.<Esc>pv_y$a = <Esc>pa.bind(this);<Esc>_ww**

" autocmd FileType javascript.jsx setlocal commentstring={/*\ %s\ */}

let g:jsx_ext_required = 0
set showcmd

map <leader>csl yss)Iconsole.log<esc>
map <leader>css yss'yss)Iconsole.log<esc>

map \fs :syntax sync fromstart<cr>
" cd to the current's file's directory
map \wd :lcd %:p:h<cr>

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
:map <silent> <C-l> :lopen<cr>
:map <silent> <C-h> :ALELint<cr>
let g:ale_fixers = {}
let g:ale_linters = {
\   'javascript': ['tsserver'],
\   'typescript': ['tsserver'],
\}
let g:ale_linters_ignore = {'typescript': ['tslint']}
map <silent> \q :ALEFix prettier<cr>

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_completion_enabled = 1

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

let g:ackprg = 'ag --nogroup --nocolor --column'

" function! GetFileInitials()
"     let @+ = @e . substitute(@0[1:-1], "[a-z]", "", "g")
"     return
" endfunction

nmap <c-p> :FZF<cr>
nmap <c-\> :Buffers<cr>
" nmap \<c-p> yiwv"ey<cr>:call GetFileInitials()<cr>:FZF<cr>
" nmap \gfi yiwv"ey<cr>:call GetFileInitials()<cr>
nmap \rrr :so $MYVIMRC<cr>

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
command! -bang -nargs=* FindRegExp call fzf#vim#grep('rg --column --line-number --no-heading --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --glob "!package-lock.json" --glob "!build" --glob "!node_modules" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(blue)%ae %C(green)%cr"'

map \fat o<c-r>0<esc>Iexport const <esc>A = '<c-r>0';<esc>
map \fa :FindLiteral<Space>
map \a :FindRegExp<Space>
map \ts f cl<cr><esc>


map \df _f cl<cr><esc>f>i<cr><esc>OclassName="d-flex"<esc>
" copy file name
map \cfn :let @0=expand('%:t')<cr>
" copy file path
map \cfp :let @0=@%<cr>
map <silent> \rat yyppk:s/REQUEST/SUCCESS/g<cr>j:s/REQUEST/FAILURE/g<cr>
map <silent> \rar \ratjdj
map <silent> \rac _/REQUEST<cr>diw"0PNhvb"mye/SUCCESS<cr>bvnh"ny/<c-r>n<cr>:s/<c-r>n/<c-r>m/<cr>N:s/<c-r>n/<c-r>m/<cr>
map <silent> \scd _f>i xs={12}<esc>
map <silent> \icn _f>i className=""<esc>
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
map <silent> \# yiw\a<c-r>0<cr>
map <silent> \md G?\<dispatch\><cr>O<c-r>0: () => dispatch(<c-r>0()),<esc>?<c-r>0<cr>
map <silent>gd :ALEGoToDefinition<cr>
" doesn't actually work, ALE doesn't implement this for typescript
map <silent>gt :ALEGoToTypeDefinition<cr>
map <silent>gh :ALEHover<cr>
map <silent>gr :ALEFindReferences -relative<cr>
map <silent>/<esc> :nohl<cr>
map <silent>\$$ :e ~/.vim/vimrc<cr>
map \$r :so ~/.vim/vimrc<cr>
map \$R :so ~/.vim/vimrc<cr>

" map <silent>gd :TsuquyomiDefinition<cr>
" map <silent>gt :TsuTypeDefinition<cr>
" autocmd FileType typescript nmap <buffer> gh : <C-u>echo tsuquyomi#hint()<CR>
