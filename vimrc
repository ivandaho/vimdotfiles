" disable pathogen
let g:pathogen_disabled = ["omnisharp-vim"]
execute pathogen#infect()
Helptags
syntax on
filetype plugin indent on

set sw=4
set ts=4
set et
set number
set updatetime=1000

set hlsearch

set scroll=5

set timeout timeoutlen=1000 ttimeoutlen=100


map gj :lnext<CR>
map gk :lprevious<CR>
" delete highlights from search etc
map fdh :nohl<CR>

" map fdp ^dwx$x| " delete print statement (python)
" map fwi ^wi(<Esc>$| " correct if statement (python)

let g:gruvbox_contrast_dark='medium'

" for terminal
let g:gruvbox_italic=1
let g:gruvbox_termcolors=256

colorscheme gruvbox
set background=dark

" this setting controls how long to wait (in ms) before fetching type / symbol information.
set updatetime=1000

"airline tabs
let g:airline#extensions#tabline#enabled = 1
nnoremap tj :bnext<cr>
nnoremap tl :bnext<cr>
nnoremap tk :bprevious<cr>
nnoremap th :bprevious<cr>
nnoremap tt :enew<cr>:o
nnoremap tq :bd<cr>

set laststatus=2
"let g:OmniSharp_typeLookupInPreview = 1
set encoding=utf-8

" OSX
set guifont=Fira\ Code
" set guifont=Menlo\ For\ Powerline

" windows
" size 9 is better for 125% hdpi scaling
" set guifont=DejaVu_Sans_Mono_for_Powerline:h9:cANSI
let g:airline_powerline_fonts = 1

"backspace fix
:set backspace=start,indent,eol

"replace current word with yanked data
:map fp lbve"0p

"explorer
:map \fe :Sexplore<cr>
let g:netrw_liststyle=3


" disable esc sound
set noeb vb t_vb=
au GUIEnter * set vb t_vb=

" ctrlp fuzzy finder plugin
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

set incsearch
set scrolloff=1

let indent_guides_guide_size=1
let indent_guides_enable_on_vim_startup=1

autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4

map \gd :Gdiff<cr>
map \gs :Gstatus<cr>
map \gc :Gcommit<cr>
map \gp :Git push<cr>
map \gb :Gblame<cr>

autocmd QuickFixCmdPost *grep* cwindow

" close tabs
map TQ :bp<cr>:bd #<cr>
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

set dictionary+=dict.txt

" blaze to react change stuff
map <leader>cc :%s/<!--/\{\/*/<cr>:%s/-->/*\/\}<cr>
map <leader>cn :%s/class=/className=/g<cr>
map <leader>cb :%s/<br>/<br\/>/g<cr>
map <leader>cl :%s/<Link to/<Link to/g<cr>:%s/<\/a>/<\/Link>/g<cr>;
map <leader>cd :%s/{{//g<cr>:%s/}}//g<cr>

" react helpers
map \rc oclass Component extends Component {<cr>render() {<cr>return (<cr>)<cr>}<cr>}<esc>%_w
map \rp oconstructor(props) {<cr>super(props);<cr>}<esc>kw
map \rf _cwfunction<Esc>elct{(props) <Esc>jd3jk$%ddv$=
map \rb othis.<Esc>pv_y$a = <Esc>pa.bind(this);<Esc>

autocmd FileType javascript.jsx setlocal commentstring={/*\ %s\ */}

let g:jsx_ext_required = 0
let g:ctrlp_custom_ignore = 'node_modules\|_public'

set showcmd
let g:ctrlp_working_path_mode = 0

map <c-]> :CtrlPClearCache<CR><C-p>

" faster go to end of line
map + g_

" console log line, delete last ';'
map <leader>cs; :s/.*\zs;//g<return>yssIconsole.log<esc>
" console log line then add ';' at end of line
map <leader>csl yss)Iconsole.log<esc>
" console log line into a string and att ';' at end of line
map <leader>css yss'yss)Iconsole.log<esc>
" fix syntax highlighting
map \fs :syntax sync fromstart<cr>
" cd to the current's file's directory
map \wd :lcd %:p:h<cr>

" spring convert variable into db mapping
:map \sv _i@Column(name= "<esc>A")<esc>hvi"yoprivate String<esc>a <esc>pA;<esc>bo<esc>j
" convert characters_like_this into charactersLikeThis
:map \cz _f_x~
" spring convert variable into getter/setters
:map \sg _ywipublic String get<esc>l~A() {<return>return <esc>pa;<return>}<return><return>public void set<esc>pblll~A(String <esc>pA) {<return>this.<esc>pA = <esc>pA;<return>}<return><esc>j
" spring convert variable into hashCode
:map \sh _ywiresult = prime * result + ((<esc>A == null) ? 0 : <esc>pa.hashCode());<esc>j
" spring convert variable into equals check
:map \st _ywiif (<esc>A == null) {<return>if (other.<esc>pA != null)<return>return false;<return>} else if (!<esc>pA.equals(other.<esc>pA))<return>return false;<return><esc>j

