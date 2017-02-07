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

"syntastic
let g:syntastic_python_python_exec = '/usr/bin/python3'
let g:syntastic_python_checkers = ['frosted']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_check_on_open = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_wq = 0

nnoremap <leader>ss :SyntasticCheck<cr>
nnoremap <leader>se :Errors<cr><C-W><C-W>
nnoremap <leader>sc :lclose<cr>
nnoremap <leader>st :SyntasticToggleMode<cr>


map foc :Errors<CR>
map gj :lnext<CR>
map gk :lprevious<CR>
map frp :w !python3<CR>
" delete highlights from search etc
map fdh :nohl<CR>

map fdp ^dwx$x| " delete print statement (python)
map fwi ^wi(<Esc>$| " correct if statement (python)

"scroll remap
map <c-j> <c-d>
map <c-k> <c-u>

"flake8
let g:flake8_show_quickfix=1
let g:flake8_show_in_gutter=1
"let g:flake8_show_in_file=1
map <F8> :call Flake8()<CR>
map f8 :call Flake8()<CR>

"solaris stuff
"if has('gui_running')
    "set background=light
"else
    "set background=dark
"endif
set background=dark

map fbd :set background=dark<CR>
map fbl :set background=light<CR>

"syntax toggle
map fsjs :set syntax=javascript<CR>
map fsh :set syntax=html<CR>


let g:gruvbox_contrast_dark='medium'

" for terminal
let g:gruvbox_italic=1
let g:gruvbox_termcolors=256

colorscheme gruvbox

"omnisharp stuff
let g:OmniSharp_timeout = 1

"Showmatch significantly slows down omnicomplete
"when the first match contains parentheses.
set noshowmatch


"don't autoselect first item in omnicomplete, show if only one item (for preview)
"remove preview if you don't want to see any documentation whatsoever.
"/set completeopt=longest,menuone,preview
" Fetch full documentation during omnicomplete requests.
" There is a performance penalty with this (especially on Mono)
" By default, only Type/Method signatures are fetched. Full documentation can still be fetched when
" you need it with the :OmniSharpDocumentation command.
" let g:omnicomplete_fetch_documentation=1
"
"
"Super tab settings - uncomment the next 4 lines
" let g:SuperTabDefaultCompletionType = 'context'
" let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
" let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
" let g:SuperTabClosePreviewOnPopupClose = 1

"Move the preview window (code documentation) to the bottom of the screen, so it doesn't move the code!
"You might also want to look at the echodoc plugin
" set splitbelow

" Get Code Issues and syntax errors
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']
" If you are using the omnisharp-roslyn backend, use the following
" let g:syntastic_cs_checkers = ['code_checker']
augroup omnisharp_commands
    autocmd!

    "Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
    autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

    " Synchronous build (blocks Vim)
    "autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
    " Builds can also run asynchronously with vim-dispatch installed
    autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
    " automatic syntax check on events (TextChanged requires Vim 7.4)
    autocmd BufEnter,InsertLeave *.cs SyntasticCheck

    " Automatically add new cs files to the nearest project on save
    autocmd BufWritePost *.cs call OmniSharp#AddToProject()

    "show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    "The following commands are contextual, based on the current cursor position.

    autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
    autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
    autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
    autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
    autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
    "finds members in the current buffer
    autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
    " cursor can be anywhere on the line containing an issue
    autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
    autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
    autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
    autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
    "navigate up by method/property/field
    autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
    "navigate down by method/property/field
    autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>

augroup END


" this setting controls how long to wait (in ms) before fetching type / symbol information.
set updatetime=1000
" Remove 'Press Enter to continue' message when type information is longer than one line.
" omni/Omni
set cmdheight=1

nnoremap <leader>sp let<space>g:syntastic_cs_checkers<space>=<space>['syntax',<space>'semantic',<space>'issues']<cr>


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
" size 9 is better for 125% hdpi scaling
set guifont=DejaVu_Sans_Mono_for_Powerline:h9:cANSI
let g:airline_powerline_fonts = 1

"backspace fix
:set backspace=start,indent,eol

"replace current word with yanked data
:map fp lbve"0p

"explorer
:map fe :Sexplore<cr>
let g:netrw_liststyle=3


" disable esc sound
set noeb vb t_vb=
au GUIEnter * set vb t_vb=

" ctrlp fuzzy finder plugin
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" disable pathogen
let g:pathogen_disabled = ["omnisharp-vim"]
set incsearch
set scrolloff=1

"
let indent_guides_guide_size=1
let indent_guides_enable_on_vim_startup=1

" au BufLeave * :IndentGuidesDisable
" au BufEnter * :IndentGuidesEnable

autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4

autocmd VimEnter * SyntasticToggleMode

map \gd :Gdiff<cr>
map \gs :Gstatus<cr>
map \gc :Gcommit<cr>
map \gp :Git push<cr>

autocmd QuickFixCmdPost *grep* cwindow

map TQ :bp<cr>:bd #<cr>
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
map <leader>cl :%s/<a href/<Link to/g<cr>:%s/<\/a>/<\/Link>/g<cr>
map <leader>cd :%s/{{//g<cr>:%s/}}//g<cr>

" react helpers
map \rc oclass Component extends Component {<cr>render() {<cr>return (<cr>)<cr>}<cr>}<esc>%_w
map \rp oconstructor(props) {<cr>super(props);<cr>}<esc>kw
map \rf _cwfunction<Esc>elct{(props) <Esc>jd3jk$%ddv$=

autocmd FileType javascript.jsx setlocal commentstring={/*\ %s\ */}

let g:jsx_ext_required = 0
let g:ctrlp_custom_ignore = 'node_modules\|_public'

set showcmd
